// ignore_for_file: prefer_const_constructors

import 'package:chart_ui_new/ui_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UiPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
