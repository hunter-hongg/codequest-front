import 'package:codequest_front/simple/simple.dart';
import 'package:codequest_front/simple/textbox.dart';
import 'package:flutter/material.dart';

// 提示页配置类
class GuideConfig {
  final String title;
  final String content;
  final String nextRoute;
  final String buttonText;

  GuideConfig({
    required this.title,
    required this.content,
    required this.nextRoute,
    this.buttonText = "继续",
  });
}

// 通用提示页组件
class GuideBasePage extends StatelessWidget {
  final GuideConfig config;

  const GuideBasePage({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Simple.simpleBar(
        title: config.title,
        back: Simple.backButton(context: context, route: '/'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Simple.nullSpace(),
            Simple.simpleRow(
              widgets: [
                ROTextBox(text: config.content, fontSize: 14),
                const SizedBox(width: 40),
                Simple.simpleClick(
                  func: () {
                    Navigator.pushNamed(context, config.nextRoute);
                  },
                  show: config.buttonText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
