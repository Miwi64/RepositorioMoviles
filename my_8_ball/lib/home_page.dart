import 'package:flutter/material.dart';
import 'package:my_8_ball/ball8.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Ball8()),
      backgroundColor: Colors.black,
    );
  }
}
