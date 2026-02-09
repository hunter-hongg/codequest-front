import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

// 第四关配置
final guan4Config = GuanConfig(
  title: "英雄出世2——读取输入2",
  description:
      "情境: 编程世界不仅需要处理字符串，还需要处理数值。现在，你需要编写一个程序，\n"
      "能够读取用户输入的整数，并输出该整数加一后的结果。\n"
      "这将是你处理数值计算的第一步。\n"
      "需求: 读取一个整数，将其加一，然后输出结果\n"
      "例如：\n"
      "输入: 42\n"
      "输出: 43\n",
  testInputs: ["123", "0", "-456", "999", "-1", "10000"],
  getExpectedOutput: (input) {
    // 将输入转换为整数并加一
    int inputInt = int.parse(input);
    return (inputInt + 1).toString();
  },
  nextRoute: '/g5',
  isSimpleTest: false, // 多测试用例模式
  showResultButton: true, // 显示结果按钮
);

// 第四关页面
class Guan4Page extends StatelessWidget {
  const Guan4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan4Config);
  }
}
