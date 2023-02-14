import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  String first = 'assets/images/dice1.png';
  String second = 'assets/images/dice2.png';

  void diceChange() {
    setState(() {
      int selection = Random().nextInt(6) + 1;
      first = 'assets/images/dice$selection.png';
      selection = Random().nextInt(6) + 1;
      second = 'assets/images/dice$selection.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(first),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(second),
            )),
          ],
        ),
        TextButton(
            onPressed: diceChange,
            child: const Text(
              'Rodar dado',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ))
      ],
    );
  }
}
