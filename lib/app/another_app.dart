import 'package:flutter/material.dart';

class AnotherApp extends StatelessWidget {
  const AnotherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.amber,
        child: const Text('Not Android Or IOS'),
      ),
    );
  }
}
