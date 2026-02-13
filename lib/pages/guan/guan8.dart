import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

final guan8Config = GuanConfig(
  title: "文字的魔法——字符串拼接2",
  description:
      "情境: 在编程世界中，文字之间的空格也是魔法的一部分。你需要学会如何在拼接字符串时，\n"
      "在它们之间添加适当的空格，使文字更加清晰可读。现在，你需要编写一个程序，\n"
      "能够读取两行用户输入的字符串，并在它们之间添加一个空格后拼接在一起输出。\n"
      "需求: 读取两行字符串，在它们之间添加一个空格后拼接在一起输出\n"
      "例如：\n"
      "输入: Hello\nWorld\n"
      "输出: Hello World\n",
  testInputs: [
    "Hello\nWorld",
    "Python\nProgramming",
    "First\nLast",
    "One\nTwo",
    "Start\nEnd",
  ],
  getExpectedOutput: (input) {
    List<String> inputStrings = input.split('\n');
    if (inputStrings.length >= 2) {
      return '${inputStrings[0]} ${inputStrings[1]}';
    }
    return inputStrings[0];
  },
  nextRoute: '/g9',
  isSimpleTest: false, // 多测试用例模式
  showResultButton: true, // 显示结果按钮
);

class Guan8Page extends StatelessWidget {
  const Guan8Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan8Config);
  }
}
