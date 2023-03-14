import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String nombre;
  const SecondPage({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                if (Navigator.canPop(context)) Navigator.pop(context, false);
              }),
          title: const Text(
            'Segunda',
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nombre, style: const TextStyle(fontSize: 30)),
            TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.pop(context, true);
                }),
            TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context, false);
                })
          ],
        ),
      ),
    );
  }
}
