import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

final guan5Config = GuanConfig(
  title: "英雄出世2——读取输入3",
  description:
      "情境: 编程世界不仅需要把数值增加，还需要处理多个数值。现在，你需要编写一个程序，\n"
      "能够读取两行用户输入的整数（每行一个整数），并输出这两个整数相加后的结果。\n"
      "这将是你处理数值计算的第二步。\n"
      "需求: 读取两行整数，将每行整数加一后，输出两行结果\n"
      "例如：\n"
      "输入: 42 56\n"
      "输出: 98\n",
  testInputs: ["123\n456", "0\n78", "-456\n999", "-1\n91", "10000\n10080"],
  getExpectedOutput: (input) {
    List<int> inputInts = input.split('\n').map(int.parse).toList();
    int sum = 0;
    for (int i = 0; i < inputInts.length; i++) {
      sum += inputInts[i];
    }
    return sum.toString();
  },
  nextRoute: '/g6',
  isSimpleTest: false, // 多测试用例模式
  showResultButton: true, // 显示结果按钮
);

class Guan5Page extends StatelessWidget {
  const Guan5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan5Config);
  }
}
