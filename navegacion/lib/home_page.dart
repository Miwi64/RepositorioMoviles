import 'package:flutter/material.dart';
import 'package:navegacion/screen/help_screen.dart';
import 'package:navegacion/screen/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Ir al login'),
            subtitle: const Text('Esta es la pantalla de inicio de sesion'),
            leading: const CircleAvatar(
              child: Text('LG'),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              final ruta = MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              );
              Navigator.push(context, ruta);
            },
          ),
          ListTile(
            title: const Text('Ir a Ayuda'),
            subtitle: const Text('Esta es la pantalla de ayuda'),
            leading: const CircleAvatar(
              child: Text('😀'),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              final ruta = MaterialPageRoute(
                builder: (_) => const HelpScreen(),
              );
              Navigator.push(context, ruta);
            },
          ),
        ],
      ),
    );
  }
}
