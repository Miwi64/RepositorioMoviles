import 'package:flutter/material.dart';
import 'package:notas/note.dart';
import 'package:notas/screens/note_screen.dart';

import 'about_screen.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final List<Note> notes = [
    Note('¡Hola!',
        'Esta es una nota de prueba. Sientete libre de borrarla si lo necesitas ;)')
  ];
  @override
  Widget build(BuildContext context) {
    void addNote(Note note) {
      setState(() {
        notes.add(note);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas Rápidas'),
      ),
      body: createList(notes),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteScreen(
                          onSave: addNote,
                          isNewNote: true,
                        )));
          }),
      drawer: createDrawer(context),
    );
  }

  Drawer createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: Text('Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )),
          ),
          ListTile(
            iconColor: Colors.red,
            title: const Text(
              'Acerca de',
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.info,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
          )
        ],
      ),
    );
  }

  ListView createList(List<Note> notes) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15.0),
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 22),
              ),
              subtitle: Text(
                  note.content.length > 29
                      ? note.content.substring(0, 28)
                      : note.content,
                  style: const TextStyle(fontSize: 15)),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return createAlert(context, notes, index);
                    },
                  );
                },
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteScreen(
                          title: note.title,
                          content: note.content,
                          onSave: (edited) {
                            setState(() {
                              note.title = edited.title;
                              note.content = edited.content;
                            });
                          },
                          isNewNote: false,
                        )),
              ),
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return createAlert(context, notes, index);
                  },
                );
              },
            ));
      },
    );
  }

  AlertDialog createAlert(BuildContext context, List<Note> notes, int index) {
    return AlertDialog(
      title: const Text('Eliminar nota'),
      content: const Text('¿Está seguro que desea eliminar esta nota?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              notes.removeAt(index);
            });
            Navigator.of(context).pop();
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
