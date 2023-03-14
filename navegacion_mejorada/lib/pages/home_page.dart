import 'package:flutter/material.dart';
import 'package:navegacion_mejorada/pages/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Inicio',
              style: TextStyle(fontSize: 50),
            ),
            MaterialButton(
                child: const Text('Ir a segunda pagina'),
                onPressed: () async {
                  Route route = MaterialPageRoute(
                      builder: (__) => const SecondPage(
                            nombre: 'Miwi',
                          ));
                  final data = await Navigator.push(context, route);
                  if (data) {
                    print('Aceptado');
                  } else {
                    print('Rechazado');
                  }
                })
          ],
        ),
      ),
    );
  }
}
