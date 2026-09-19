import 'package:flutter/material.dart';
import 'screen/homebmi.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {

  const myapp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const bmiscreen(),
    );
  }
}