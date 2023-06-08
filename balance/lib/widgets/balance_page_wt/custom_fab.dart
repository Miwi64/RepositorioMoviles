import 'package:balance/pages/add_entries.dart';
import 'package:balance/pages/add_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../utils/animated_route.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({super.key});

  @override
  Widget build(BuildContext context) {
    List<SpeedDialChild> botones = [];
    botones.add(SpeedDialChild(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.remove),
        label: 'Gasto',
        labelStyle: const TextStyle(fontSize: 20),
        onTap: () {
          Navigator.push(context, AnimatedRoute(AddExpenses()));
        }));
    botones.add(SpeedDialChild(
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.add),
        label: 'Ingreso',
        labelStyle: const TextStyle(fontSize: 20),
        onTap: () {
          Navigator.push(
              context,
              AnimatedRoute(const AddEntries(),
                  animate: Curves.easeInOutBack, duration: 3000));
        }));
    return SpeedDial(
      backgroundColor: Colors.lime,
      icon: Icons.add,
      activeIcon: Icons.close,
      childMargin: const EdgeInsets.symmetric(horizontal: 2),
      childrenButtonSize: const Size(63, 63),
      children: botones,
    );
  }
}
