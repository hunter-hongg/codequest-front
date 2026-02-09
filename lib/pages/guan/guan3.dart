import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guan/guan_base.dart';

// 第三关配置
final guan3Config = GuanConfig(
  title: "英雄出世1——读取输入1",
  description:
      "情境: 编程世界的交互能力是成为大师的关键。现在，你需要编写一个程序，\n"
      "能够读取用户输入的字符串，并将其原封不动地输出。\n"
      "这将是你与程序世界交互的第一步。\n"
      "需求: 读取一个字符串，然后将其输出\n"
      "例如：\n"
      "输入: Hello\n"
      "输出: Hello",
  testInputs: [
    "Hello, World!",
    "你好，世界！",
    "Hello, CodeQuest!",
    "Hello, Python!",
    "你好，Python！",
    "Hello.",
  ],
  getExpectedOutput: (input) => input, // 直接返回输入作为期望输出
  nextRoute: '/guide2',
  isSimpleTest: false, // 多测试用例模式
  showResultButton: true, // 显示结果按钮
);

// 第三关页面
class Guan3Page extends StatelessWidget {
  const Guan3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuanBasePage(config: guan3Config);
  }
}
