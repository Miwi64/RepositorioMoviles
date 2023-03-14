import 'package:cronometro/pages/cronometer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        alignment: Alignment.center,
        child: const SafeArea(child: Cronometer()),
      ),
    );
  }
}
