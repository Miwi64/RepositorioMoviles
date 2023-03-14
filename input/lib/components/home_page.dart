import 'package:flutter/material.dart';

import 'inputs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input')),
      body: SafeArea(
          child: Column(
        children: const [
          Inputs(
            labelNombre: 'Nombre usuario',
            icono: Icon(Icons.account_circle, color: Colors.lightBlue),
            color: Colors.lightBlue,
          ),
          Inputs(
            labelNombre: 'Telefono',
            tipoTeclado: TextInputType.phone,
            icono: Icon(Icons.phone, color: Colors.purple),
            color: Colors.purple,
          ),
          Inputs(
            labelNombre: 'Contraseña',
            ocultarTexto: true,
            tipoTeclado: TextInputType.visiblePassword,
            textoAyuda: 'ingresa una contraseña',
            icono: Icon(Icons.password, color: Colors.teal),
          ),
          Inputs()
        ],
      )),
    );
  }
}
