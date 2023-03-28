import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final Function? ok;
  final Function? cancel;
  const ActionButtons({super.key, this.ok, this.cancel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          onPressed: () {
            ok!();
          },
          color: Colors.lime,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text(
                  'Aceptar',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.grey.shade800,
                  width: 2,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(35)),
          onPressed: () {
            cancel!();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.close,
                    color: Colors.lime,
                    size: 25,
                  ),
                ),
                Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 18, color: Colors.lime),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
