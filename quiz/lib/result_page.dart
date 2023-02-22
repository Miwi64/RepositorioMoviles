import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.resultados});
  final List<Icon> resultados;

  @override
  Widget build(BuildContext context) {
    int correctas =
        resultados.where((icon) => icon.color == Colors.green).length;

    return Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Respuestas correctas",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          "$correctas de ${resultados.length.toString()}",
                          style: const TextStyle(
                              fontSize: 50, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                          child: const Text(
                            'Volver a Intentar',
                            style: TextStyle(fontSize: 25),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  )),
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: resultados,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
