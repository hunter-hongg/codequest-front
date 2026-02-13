import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

final guan7Config = GuanConfig(
  title: "文字的魔法——字符串拼接1",
  description:
      "情境: 在编程世界中，文字是最基本的魔法元素。你需要学会如何将不同的文字组合在一起，\n"
      "创造出新的魔法。现在，你需要编写一个程序，能够读取两行用户输入的字符串，\n"
      "并将它们拼接在一起输出。这将是你处理字符串的第一步。\n"
      "需求: 读取两行字符串，将它们拼接在一起输出\n"
      "例如：\n"
      "输入: Hello\nWorld\n"
      "输出: HelloWorld\n",
  testInputs: ["Hello\nWorld", "Python\nProgramming", "123\n456", "\nEmpty", "Space\n Space"],
  getExpectedOutput: (input) {
    List<String> inputStrings = input.split('\n');
    if (inputStrings.length >= 2) {
      return inputStrings[0] + inputStrings[1];
    }
    return inputStrings[0];
  },
  nextRoute: '/g8',
  isSimpleTest: false, // 多测试用例模式
  showResultButton: true, // 显示结果按钮
);

class Guan7Page extends StatelessWidget {
  const Guan7Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan7Config);
  }
}