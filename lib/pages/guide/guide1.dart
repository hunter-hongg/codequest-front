import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guide/guide_base.dart';

// 介绍print和input用法的提示页配置
final guide1Config = GuideConfig(
  title: "编程基础入门",
  content:
      "在开始编程之旅前，让我们先学习两个最基础的Python函数：\n\n"
      "1. print() 函数 - 用于输出内容到屏幕\n"
      "   示例：print('Hello, World!')\n"
      "   输出：Hello, World!\n\n"
      "2. input() 函数 - 用于从用户获取输入\n"
      "   示例：name = input()\n"
      "   当运行这段代码时，程序会等待用户输入内容，\n"
      "   并将输入的内容存储在name变量中。\n\n"
      "这两个函数是Python编程的基础，我们的第一个关卡将使用它们。\n\n"
      "接下来，让我们来学习一下变量。\n"
      "变量是用来存储数据的容器，我们可以给变量赋值，\n"
      "并在后续的代码中使用这个值。\n\n"
      "例如：\n"
      "   age = 18\n"
      "   print(age)\n"
      "   输出：18\n\n"
      "这就是变量的基本用法。\n\n"
      "在我们的关卡中，我们将学习如何使用变量来存储用户输入的内容。",
  nextRoute: '/g1',
  buttonText: "开始编程之旅",
);

// 介绍print和input用法的提示页
class Guide1Page extends StatelessWidget {
  const Guide1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuideBasePage(config: guide1Config);
  }
}
