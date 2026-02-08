import 'dart:convert';
import 'package:codequest_front/simple/random.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:codequest_front/simple/simple.dart';
import 'package:codequest_front/simple/textbox.dart';
import 'package:flutter/material.dart';

class Guan3Page extends ConsumerStatefulWidget {
  const Guan3Page({super.key});

  @override
  ConsumerState<Guan3Page> createState() => _Guan3PageState();
}

class _Guan3PageState extends ConsumerState<Guan3Page> {
  TextEditingController input = TextEditingController();
  String runStatus = "";
  String runOut = "";
  int success = 0;
  String inputValue = "";

  @override
  Widget build(BuildContext context) {
    final inputValues = [
      "Hello, World!",
      "你好，世界！",
      "Hello, CodeQuest!",
      "Hello, Python!",
      "你好，Python！",
      "Hello.",
    ];
    return Scaffold(
      appBar: Simple.simpleBar(
        title: "英雄出世1——读取输入1",
        back: Simple.backButton(context: context, route: '/'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ROTextBox(
              text:
                  "情境: 编程世界的交互能力是成为大师的关键。现在，你需要编写一个程序，\n"
                  "能够读取用户输入的字符串，并将其原封不动地输出。\n"
                  "这将是你与程序世界交互的第一步。\n"
                  "需求: 读取一个字符串，然后将其输出\n"
                  "提示: 使用input()函数读取输入，print()函数输出结果\n"
                  "例如：\n"
                  "输入: Hello\n"
                  "输出: Hello",
            ),
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
                  func: () {
                    setState(() {
                      inputValue = choice(inputValues);
                    });
                    http
                        .post(
                          Uri.parse('http://localhost:3000/run'),
                          headers: {'Content-Type': 'application/json'},
                          body: jsonEncode({
                            'code': input.text,
                            'input': inputValue,
                          }),
                        )
                        .then((response) {
                          if (response.statusCode == 200) {
                            final result = jsonDecode(response.body);
                            if (!result['success']) {
                              setState(() {
                                runStatus = "运行失败";
                                runOut = result['stderr'];
                                success = 0;
                              });
                              return;
                            }
                            final stdout = result['stdout'];
                            if (stdout.toString().trim() != inputValue.trim()) {
                              setState(() {
                                runStatus = "结果错误";
                                runOut = result['stdout'];
                                success = 0;
                              });
                            } else {
                              setState(() {
                                runStatus = "结果正确";
                                runOut = result['stdout'];
                                success = 1;
                              });
                            }
                          }
                        });
                  },
                  show: "运行",
                ),
                Simple.simpleClick(
                  func: () {
                    if (success != 0) {
                      Navigator.pushNamed(context, '/g4');
                    } else {
                      Simple.simpleWarn(context: context, show: '未通过本关');
                    }
                  },
                  show: '下一关',
                ),
              ],
            ),
            Simple.simpleSpace(),
            ROTextBox(
              text: "运行结果: $runStatus\n运行输入: \n$inputValue\n运行输出: \n$runOut",
            ),
          ],
        ),
      ),
    );
  }
}
