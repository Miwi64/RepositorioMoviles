import 'package:flutter/material.dart';
import 'dice.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      appBar: AppBar(title: const Text("Dice App")),
      body: const Dice(),
    );
  }
}
