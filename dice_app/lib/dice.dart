import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        dado(Random().nextInt(6) + 1),
        dado(Random().nextInt(6) + 1),
      ],
    );
  }

  Expanded dado(diceValue) {
    return Expanded(
        child: TextButton(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset('assets/images/dice$diceValue.png'),
      ),
      onPressed: () {
        setState(() {});
      },
    ));
  }
}
