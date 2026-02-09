import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guide/guide_base.dart';

// 介绍int函数和整数运算的提示页配置
final guide2Config = GuideConfig(
  title: "编程基础入门2",
  content:
      "在这一关中，我们将学习如何处理数值和进行数学运算。\n\n"
      "1. **int() 函数** - 用于将字符串转换为整数\n"
      "   示例：num = int(input())\n"
      "   这段代码会读取用户输入的字符串，并将其转换为整数存储在num变量中。\n\n"
      "2. **整数的六则运算**\n"
      "   - 加法：+  示例：5 + 3 = 8\n"
      "   - 减法：-  示例：5 - 3 = 2\n"
      "   - 乘法：*  示例：5 * 3 = 15\n"
      "   - 除法：/  示例：5 / 3 = 1.666...\n"
      "   - 取模：%  示例：5 % 3 = 2 （返回除法的余数）\n"
      "   - 幂运算：** 示例：5 ** 3 = 125 （5的3次方）\n\n"
      "注意：在Python中，整数和浮点数的运算会得到浮点数结果。",
  nextRoute: '/g4',
  buttonText: "开始第四关",
);

// 介绍int函数和整数运算的提示页
class Guide2Page extends StatelessWidget {
  const Guide2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuideBasePage(config: guide2Config);
  }
}
