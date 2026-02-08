import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:codequest_front/simple/simple.dart';
import 'package:codequest_front/simple/textbox.dart';
import 'package:flutter/material.dart';

class Guan1Page extends ConsumerStatefulWidget {
  const Guan1Page({super.key});

  @override
  ConsumerState<Guan1Page> createState() => _Guan1PageState();
}

class _Guan1PageState extends ConsumerState<Guan1Page> {
  TextEditingController input = TextEditingController();
  String runStatus = "";
  String runOut = "";
  int success = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Simple.simpleBar(
        title: "英雄出世1——你好世界1",
        back: Simple.backButton(context: context, route: '/'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            ROTextBox(
              text:
                  "情境: 在混沌初开的代码大陆上，每一位伟大的程序员都始于一声响亮的宣告。\n"
                  "你，一位即将踏上编程征途的新晋英雄，必须向这个世界发出你的第一声问候——\n"
                  "这是你存在的证明，也是冒险的起点。\n"
                  "需求: 输出Hello World\n"
                  "输出: \n"
                  "Hello, World!",
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
                    http
                        .post(
                          Uri.parse('http://localhost:3000/run'),
                          headers: {'Content-Type': 'application/json'},
                          body: jsonEncode({'code': input.text, 'input': ''}),
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
                            if (stdout.toString().trim() !=
                                "Hello, World!".trim()) {
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
                      Navigator.pushNamed(context, '/g2');
                    } else {
                      Simple.simpleWarn(context: context, show: '未通过本关');
                    }
                  },
                  show: '下一关',
                ),
              ],
            ),
            Simple.simpleSpace(),
            ROTextBox(text: "运行结果: $runStatus\n运行输出: \n$runOut"),
          ],
        ),
      ),
    );
  }
}
