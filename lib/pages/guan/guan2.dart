import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:codequest_front/simple/simple.dart';
import 'package:codequest_front/simple/textbox.dart';
import 'package:flutter/material.dart';

class Guan2Page extends ConsumerStatefulWidget {
  const Guan2Page({super.key});

  @override
  ConsumerState<Guan2Page> createState() => _Guan2PageState();
}

class _Guan2PageState extends ConsumerState<Guan2Page> {
  TextEditingController input = TextEditingController();
  String runStatus = "";
  String runOut = "";
  int success = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Simple.simpleBar(
        title: "英雄出世1——你好世界2",
        back: Simple.backButton(context: context, route: '/'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            ROTextBox(
              text:
                  "情境: 随着你的第一声问候响彻代码大陆，古老的东方智慧也被唤醒。\n"
                  "现在，你需要同时用中英文向世界问好，展现你跨越文化的编程能力。\n"
                  "这是通往编程大师之路的第二道考验。\n"
                  "需求: 输出两行文字，第一行用英文问候，第二行用中文问候\n"
                  "输出: \n"
                  "Hello, World!\n"
                  "你好，世界！",
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
                                "Hello, World!\n你好，世界！".trim()) {
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
                      Navigator.pushNamed(context, '/g3');
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
