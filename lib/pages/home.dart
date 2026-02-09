import 'package:codequest_front/simple/simple.dart';
import 'package:codequest_front/simple/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Simple.simpleBar(title: "编程实验室"),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text("开心Python编程", style: Styles.simpleTextUpStyle()),
            const SizedBox(height: 130),
            Simple.simpleClick(
              func: () {
                Navigator.pushNamed(context, '/guide1');
              },
              show: "开始编程之旅",
            ),
          ],
        ),
      ),
    );
  }
}
