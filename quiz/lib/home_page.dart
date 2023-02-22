import 'package:flutter/material.dart';
import 'package:quiz/result_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> puntuacion = [];
  List<String> preguntas = [
    '¿Los globulos rojos viven 4 meses?',
    '¿El cuerpo humano adulto tiene 306 huesos?',
    'La cobalamina es una vitamina',
    'Las arañas son insectos',
    'Existen animales autotrofos',
    'CO2 es dioxido de carbono'
  ];
  List<bool> respuestas = [true, false, true, false, false, true];

  int numeroPregunta = 0;

  void putMark(value) {
    if (value) {
      puntuacion.add(const Icon(
        Icons.check,
        color: Colors.green,
        size: 30,
      ));
    } else {
      puntuacion.add(const Icon(
        Icons.close,
        color: Colors.red,
        size: 30,
      ));
    }

    if (puntuacion.length == preguntas.length) {
      numeroPregunta = 0;
      List<Icon> puntuaciones = List.from(puntuacion);
      puntuacion.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultPage(
                  resultados: puntuaciones,
                )),
      );
    } else {
      numeroPregunta++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  preguntas[numeroPregunta],
                  style: const TextStyle(fontSize: 30, color: Colors.white),
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
                        'Verdadero',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {
                        setState(() {
                          putMark(respuestas[numeroPregunta]);
                        });
                      }),
                ),
              )),
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
                        'Falso',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {
                        setState(() {
                          putMark(!respuestas[numeroPregunta]);
                        });
                      }),
                ),
              )),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: puntuacion,
              ),
            ),
          )
        ],
      ),
    );
  }
}
