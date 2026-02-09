import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

// 第二关配置
final guan2Config = GuanConfig(
  title: "英雄出世1——你好世界2",
  description:
      "情境: 随着你的第一声问候响彻代码大陆，古老的东方智慧也被唤醒。\n"
      "现在，你需要同时用中英文向世界问好，展现你跨越文化的编程能力。\n"
      "这是通往编程大师之路的第二道考验。\n"
      "需求: 输出两行文字，第一行用英文问候，第二行用中文问候\n"
      "输出: \n"
      "Hello, World!\n"
      "你好，世界！",
  testInputs: [""], // 空输入
  getExpectedOutput: (input) => "Hello, World!\n你好，世界！",
  nextRoute: '/g3',
  isSimpleTest: true,
  showResultButton: true,
);

// 第二关页面
class Guan2Page extends StatelessWidget {
  const Guan2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan2Config);
  }
}
