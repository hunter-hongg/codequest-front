import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

final guan6Config = GuanConfig(
  title: "英雄出世2——读取输入4",
  description:
      "情境: 编程世界不仅需要增加，还需要更神奇的魔法——乘方。现在，你需要编写一个程序，\n"
      "能够读取两行用户输入的整数a b（每行一个整数），并输出a的b次方的结果。\n"
      "这将是你处理数值计算的第三步。\n"
      "需求: 读取两行整数a b，将a的b次方的结果输出\n"
      "例如：\n"
      "输入: 3 5\n"
      "输出: 243\n",
  testInputs: ["3\n5", "0\n78", "-456\n2", "-1\n91", "10000\n2"],
  getExpectedOutput: (input) {
    List<int> inputInts = input.split('\n').map(int.parse).toList();
    int a = inputInts[0];
    int b = inputInts[1];
    int result = 1;
    for (int i = 0; i < b; i++) {
      result *= a;
    }
    return result.toString();
  },
  nextRoute: '/g7',
  isSimpleTest: false, // 多测试用例模式
  showResultButton: true, // 显示结果按钮
);

class Guan6Page extends StatelessWidget {
  const Guan6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan6Config);
  }
}
