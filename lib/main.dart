import 'package:flutter/material.dart';
import 'package:my_task/Page1.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: const Page1(),
    );
  }
}
