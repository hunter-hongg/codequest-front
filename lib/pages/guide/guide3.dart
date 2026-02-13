import 'package:flutter/material.dart';
import 'package:codequest_front/pages/guide/guide_base.dart';

// 介绍字符串拼接的提示页配置
final guide3Config = GuideConfig(
  title: "编程基础入门3",
  content:
      "在这一关中，我们将学习如何处理文本和进行字符串拼接。\n"
      "1. **字符串拼接** - 将多个字符串连接成一个字符串\n"
      "   示例：name = \"Alice\" \n"
      "         greeting = \"Hello, \" + name + \"!\" \n"
      "   这段代码会将三个字符串拼接成：\"Hello, Alice!\"\n\n"
      "2. **字符串拼接的多种方式**\n"
      "   - 使用+号：\"Hello\" + \" \" + \"World\" = \"Hello World\"\n"
      "   - 使用f-string：f\"Hello {name}\" = \"Hello Alice\"\n"
      "   - 使用join方法：\"-\".join([\"a\", \"b\", \"c\"]) = \"a-b-c\"\n\n"
      "3. **字符串与其他类型的拼接**\n"
      "   当需要将数字与字符串拼接时，需要先将数字转换为字符串：\n"
      "   age = 25\n"
      "   text = \"Age: \" + str(age)  # 结果：\"Age: 25\"\n\n"
      "4. **字符串的重复**\n"
      "   可以使用*号重复字符串：\n"
      "   \"Hi\" * 3 = \"HiHiHi\"\n\n"
      "在接下来的关卡中，你将练习各种字符串拼接操作。",
  nextRoute: '/g7',
  buttonText: "开始第七关",
);

// 介绍字符串拼接的提示页
class Guide3Page extends StatelessWidget {
  const Guide3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GuideBasePage(config: guide3Config);
  }
}
