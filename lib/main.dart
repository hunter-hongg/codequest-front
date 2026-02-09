import 'package:flutter/material.dart';
import 'package:codequest_front/pages/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      theme: ThemeData(fontFamily: "FiraCode"),
      routes: {
        '/': (context) => HomePage(),
        '/guide1': (context) => Guide1Page(),
        '/guide2': (context) => Guide2Page(),
        '/g1': (context) => Guan1Page(),
        '/g2': (context) => Guan2Page(),
        '/g3': (context) => Guan3Page(),
        '/g4': (context) => Guan4Page(),
      },
    );
  }
}

void main() async {
  runApp(MyApp());
}
