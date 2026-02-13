import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

final guan9Config = GuanConfig(
  title: "文字的魔法——字符串拼接3",
  description:
      "情境: 在编程世界中，文字和数字经常需要结合使用。你需要学会如何将数字转换为字符串，\n"
      "然后与其他字符串拼接在一起。现在，你需要编写一个程序，能够读取一行字符串和一行整数，\n"
      "并将它们拼接在一起输出。这将是你处理不同类型数据拼接的第一步。\n"
      "需求: 读取一行字符串和一行整数，将它们拼接在一起输出\n"
      "例如：\n"
      "输入: Age\n25\n"
      "输出: Age25\n",
  testInputs: [
    "Age\n25",
    "Score\n100",
    "Count\n0",
    "Number\n-42",
    "Value\n9999",
  ],
  getExpectedOutput: (input) {
    List<String> inputLines = input.split('\n');
    if (inputLines.length >= 2) {
      String text = inputLines[0];
      String numStr = inputLines[1];
      return text + numStr;
    }
    return inputLines[0];
  },
  nextRoute: '/',
  isSimpleTest: false, // 多测试用例模式
  showResultButton: true, // 显示结果按钮
);

class Guan9Page extends StatelessWidget {
  const Guan9Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan9Config);
  }
}
