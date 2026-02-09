import 'dart:convert';
import 'package:codequest_front/simple/random.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:codequest_front/simple/simple.dart';
import 'package:codequest_front/simple/textbox.dart';
import 'package:flutter/material.dart';

// 关卡配置类
class GuanConfig {
  final String title;
  final String description;
  final List<String> testInputs;
  final String Function(String) getExpectedOutput;
  final String nextRoute;
  final bool isSimpleTest; // true表示单测试用例，false表示多测试用例
  final bool showResultButton; // 是否显示结果按钮

  GuanConfig({
    required this.title,
    required this.description,
    required this.testInputs,
    required this.getExpectedOutput,
    required this.nextRoute,
    this.isSimpleTest = false,
    this.showResultButton = false,
  });
}

// 通用关卡页面组件
class GuanBasePage extends ConsumerStatefulWidget {
  final GuanConfig config;

  const GuanBasePage({super.key, required this.config});

  @override
  ConsumerState<GuanBasePage> createState() => _GuanBasePageState();
}

class _GuanBasePageState extends ConsumerState<GuanBasePage> {
  TextEditingController input = TextEditingController();
  String runStatus = "";
  String runOut = "";
  int success = 0;
  String inputValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Simple.simpleBar(
        title: widget.config.title,
        back: Simple.backButton(context: context, route: '/'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            ROTextBox(text: widget.config.description),
            Simple.simpleSpace(),
            Simple.simpleInputMulti(
              controller: input,
              label: "请输入Python代码",
              hint: "请输入代码",
            ),
            Simple.simpleSpace(),
            Simple.nullSpace(),
            Simple.simpleRow(
              widgets: [
                Simple.simpleClick(
                  func: () async {
                    await _runCode();
                  },
                  show: "运行",
                ),
                if (widget.config.showResultButton)
                  Simple.simpleClick(
                    func: () {
                      Simple.simpleInfo(
                        show:
                            "运行结果: $runStatus\n运行输入: \n$inputValue\n运行输出: \n$runOut",
                        context: context,
                      );
                    },
                    show: "结果",
                  ),
                Simple.simpleClick(
                  func: () {
                    if (success != 0) {
                      Navigator.pushNamed(context, widget.config.nextRoute);
                    } else {
                      Simple.simpleWarn(context: context, show: '未通过本关');
                    }
                  },
                  show: '继续',
                ),
              ],
            ),
            Simple.simpleSpace(),
            ROTextBox(text: "运行结果: $runStatus"),
          ],
        ),
      ),
    );
  }

  // 运行代码的通用方法
  Future<void> _runCode() async {
    setState(() {
      runStatus = "测试中...";
      runOut = "";
      inputValue = "";
      success = 0;
    });

    bool allPassed = true;
    StringBuffer outputBuffer = StringBuffer();
    String failedInput = "";

    // 根据配置选择测试方式
    if (widget.config.isSimpleTest) {
      // 单测试用例模式
      String testInput = widget.config.testInputs[0];
      try {
        final response = await http.post(
          Uri.parse('http://localhost:3000/run'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'code': input.text, 'input': testInput}),
        );

        if (response.statusCode == 200) {
          final result = jsonDecode(response.body);
          if (!result['success']) {
            // 运行失败
            allPassed = false;
            setState(() {
              runStatus = "运行失败";
              runOut = result['stderr'];
              success = 0;
            });
            return;
          }

          final stdout = result['stdout'];
          String expectedOutput = widget.config.getExpectedOutput(testInput);
          if (stdout.toString().trim() != expectedOutput.trim()) {
            // 结果错误
            allPassed = false;
            setState(() {
              runStatus = "结果错误";
              runOut = stdout;
              success = 0;
            });
          } else {
            // 测试通过
            setState(() {
              runStatus = "结果正确";
              runOut = stdout;
              success = 1;
            });
          }
        } else {
          // 请求失败
          allPassed = false;
          setState(() {
            runStatus = "服务器请求失败";
            runOut = "状态码: ${response.statusCode}";
            success = 0;
          });
        }
      } catch (e) {
        // 网络错误等异常
        allPassed = false;
        setState(() {
          runStatus = "发生异常";
          runOut = e.toString();
          success = 0;
        });
      }
    } else {
      // 多测试用例模式
      // 遍历所有测试用例
      for (String testInput in widget.config.testInputs) {
        try {
          final response = await http.post(
            Uri.parse('http://localhost:3000/run'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'code': input.text, 'input': testInput}),
          );

          if (response.statusCode == 200) {
            final result = jsonDecode(response.body);
            if (!result['success']) {
              // 运行失败
              allPassed = false;
              outputBuffer.writeln("测试用例 '$testInput' 运行失败:");
              outputBuffer.writeln(result['stderr']);
              break;
            }

            final stdout = result['stdout'].toString().trim();
            String expectedOutput = widget.config.getExpectedOutput(testInput);
            if (stdout != expectedOutput) {
              // 结果错误
              allPassed = false;
              failedInput = testInput;
              outputBuffer.writeln("测试用例 '$testInput' 结果错误:");
              outputBuffer.writeln("期望输出: $expectedOutput");
              outputBuffer.writeln("实际输出: $stdout");
              break;
            } else {
              // 当前测试通过
              outputBuffer.writeln("测试用例 '$testInput' 通过");
            }
          } else {
            // 请求失败
            allPassed = false;
            outputBuffer.writeln("服务器请求失败，状态码: ${response.statusCode}");
            break;
          }
        } catch (e) {
          // 网络错误等异常
          allPassed = false;
          outputBuffer.writeln("发生异常: $e");
          break;
        }
      }

      // 更新UI状态
      setState(() {
        if (allPassed) {
          runStatus = "全部测试通过";
          inputValue = choice(widget.config.testInputs);
          runOut = widget.config.getExpectedOutput(inputValue);
          success = 1;
        } else {
          runStatus = "测试失败";
          runOut = outputBuffer.toString();
          if (failedInput.isNotEmpty) {
            inputValue = failedInput;
          } else {
            inputValue = "";
          }
          success = 0;
        }
      });
    }
  }
}
