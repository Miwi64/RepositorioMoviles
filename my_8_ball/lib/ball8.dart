import 'dart:math';

import 'package:flutter/material.dart';

class Ball8 extends StatefulWidget {
  const Ball8({super.key});

  @override
  State<Ball8> createState() => _Ball8State();
}

class _Ball8State extends State<Ball8> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ball(Random().nextInt(5) + 1)],
        )
      ],
    );
  }

  Expanded ball(value) {
    return Expanded(
        child: TextButton(
      child: Image.asset('assets/images/$value.png'),
      onPressed: () {
        setState(() {});
      },
    ));
  }
}
