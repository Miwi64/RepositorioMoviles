import 'package:balance/models/combined_model.dart';
import 'package:flutter/material.dart';

import 'action_buttons.dart';

class BSNumKeyboard extends StatefulWidget {
  final CombinedModel combinedModel;
  const BSNumKeyboard({super.key, required this.combinedModel});

  @override
  State<BSNumKeyboard> createState() => _BSNumKeyboardState();
}

class _BSNumKeyboardState extends State<BSNumKeyboard> {
  String importe = '0.00';
  @override
  Widget build(BuildContext context) {
    String Function(Match) mathFunc;
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc = (Match match) => '${match[1]},';
    return GestureDetector(
      onTap: () {
        _numPad();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              //'\$ $importe',
              '\$ ${importe.replaceAllMapped(reg, mathFunc)}',
              style: const TextStyle(
                  fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            const Text(
              'Cantidad ingresada',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  _numPad() {
    _num(String _text, double _height) {
      String pattern = r'^([1-9]\d*|0)(\.\d{0,2})?$';
      RegExp regex = RegExp(pattern);
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() {
          if (importe == '0.00') importe = '';
          if (regex.hasMatch(importe + _text)) importe += _text;
        }),
        child: SizedBox(
          height: _height,
          child: Center(
            child: Text(_text,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
        ),
      );
    }

    showModalBottomSheet(
        barrierColor: Colors.transparent,
        //isDismissible: false,
        //enableDrag: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SizedBox(
              height: 900,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                var _height = constraints.biggest.height / 5;
                return Column(
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          _num('1', _height),
                          _num('2', _height),
                          _num('3', _height),
                        ]),
                        TableRow(children: [
                          _num('4', _height),
                          _num('5', _height),
                          _num('6', _height),
                        ]),
                        TableRow(children: [
                          _num('7', _height),
                          _num('8', _height),
                          _num('9', _height),
                        ]),
                        TableRow(children: [
                          _num('.', _height),
                          _num('0', _height),
                          GestureDetector(
                            onTap: () => setState(() {
                              if (importe.isNotEmpty) {
                                importe =
                                    importe.substring(0, importe.length - 1);
                              }
                            }),
                            onLongPress: () {
                              setState(() {
                                importe = '0.00';
                              });
                            },
                            behavior: HitTestBehavior.opaque,
                            child: SizedBox(
                                height: _height,
                                child: const Icon(
                                  Icons.backspace,
                                  size: 35,
                                )),
                          )
                        ]),
                      ],
                    ),
                    ActionButtons(
                      ok: () {
                        setState(() {
                          if (importe.isEmpty) importe = '0.00';
                          widget.combinedModel.amount =
                              double.tryParse(importe);
                          Navigator.pop(context);
                        });
                      },
                      cancel: () {
                        setState(() {
                          importe = '0.00';
                        });
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              }),
            ),
          );
        });
  }
}
