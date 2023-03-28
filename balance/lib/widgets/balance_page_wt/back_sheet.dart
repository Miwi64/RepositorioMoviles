import 'package:balance/utils/constants.dart';
import 'package:flutter/material.dart';

class BackSheet extends StatelessWidget {
  const BackSheet({super.key});

  @override
  Widget build(BuildContext context) {
    cabecera(String nombre, String cantidad, Color color) {
      return Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 5),
              child: Text(
                nombre,
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.5,
                ),
              )),
          Text(cantidad,
              style: TextStyle(color: color, fontSize: 25, letterSpacing: 1.5))
        ],
      );
    }

    return Container(
      height: 250,
      decoration:
          Constants.sheetBoxDecoration(Theme.of(context).primaryColorDark),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          cabecera('Ingresos', '\$ 3,500.00', Colors.lime),
          const VerticalDivider(thickness: 2),
          cabecera('Gastos', '\$ 1,250.00', Colors.redAccent)
        ],
      ),
    );
  }
}
