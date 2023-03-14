import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Acerca de'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            child: const ListTile(
              contentPadding: EdgeInsets.all(10.0),
              iconColor: Colors.red,
              leading: Icon(Icons.info),
              title: Text('Version de la aplicacion'),
              subtitle: Text('1.0'),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            child: const ListTile(
              contentPadding: EdgeInsets.all(10.0),
              iconColor: Colors.red,
              leading: Icon(Icons.account_circle),
              title: Text('Desarrollador'),
              subtitle: Text('Miguel Argote Reyes'),
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: const ListTile(
                iconColor: Colors.red,
                contentPadding: EdgeInsets.all(10.0),
                leading: Icon(Icons.calendar_today),
                title: Text('Fecha de publicacion'),
                subtitle: Text('27 de Febrero de 2023'),
              ))
        ],
      ),
    );
  }
}
