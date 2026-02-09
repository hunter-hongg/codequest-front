import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

// 第一关配置
final guan1Config = GuanConfig(
  title: "英雄出世1——你好世界1",
  description:
      "情境: 在混沌初开的代码大陆上，每一位伟大的程序员都始于一声响亮的宣告。\n"
      "你，一位即将踏上编程征途的新晋英雄，必须向这个世界发出你的第一声问候——\n"
      "这是你存在的证明，也是冒险的起点。\n"
      "需求: 输出Hello World\n"
      "输出: \n"
      "Hello, World!",
  testInputs: [""], // 空输入
  getExpectedOutput: (input) => "Hello, World!",
  nextRoute: '/g2',
  isSimpleTest: true,
  showResultButton: true,
);

// 第一关页面
class Guan1Page extends StatelessWidget {
  const Guan1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan1Config);
  }
}
