import 'package:flutter/material.dart';

class ROTextBox extends StatelessWidget {
  final String text;

  const ROTextBox({super.key, required this.text, this.fontSize = 16});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    // 获取默认的 InputDecoration 样式（可选）
    final theme = Theme.of(context);
    final decoration = InputDecoration(
      border: OutlineInputBorder(), // 和 TextField 一样的边框
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.primary),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      isDense: false,
    );

    return Container(
      padding: decoration.contentPadding,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1.0),
        borderRadius: BorderRadius.circular(4.0), // 默认 TextField 圆角是 4.0
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, height: 1.4),
        textAlign: TextAlign.start,
        softWrap: true,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
