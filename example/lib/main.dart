import 'package:flutter/material.dart';
import 'package:matrix_terminal/matrix_terminal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Container(
        color: Colors.black,
        child: MatrixTerminal(characterStream: mockAiAnswser()),
      ),
    );
  }
}

Stream<String> mockAiAnswser() async* {
  var answer =
      'Machine learning is a subset of artificial intelligence that enables computers to learn and make decisions from data without being explicitly programmed for every task.';
  for (int i = 0; i < answer.length; i++) {
    await Future.delayed(Duration(milliseconds: 25));
    var char = answer[i];
    yield char;
  }
}
