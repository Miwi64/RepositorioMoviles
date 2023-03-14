import 'package:flutter/material.dart';

import '../note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen(
      {super.key,
      this.title = '',
      this.content = '',
      required this.onSave,
      required this.isNewNote});
  final String title;
  final String content;
  final Function(Note) onSave;
  final bool isNewNote;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  bool isEditEnabled = false;

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.title;
    _contentController.text = widget.content;
    return Scaffold(
      backgroundColor: Colors.yellowAccent.shade100,
      appBar: AppBar(actions: [
        Visibility(
          visible: isEditEnabled || widget.isNewNote,
          child: IconButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form!.validate()) {
                  final note = Note(
                    _titleController.text,
                    _contentController.text,
                  );
                  widget.onSave(note);
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.save)),
        ),
        Visibility(
          visible: isEditEnabled && !widget.isNewNote,
          child: IconButton(
              onPressed: () {
                setState(() {
                  _titleController.text = widget.title;
                  _contentController.text = widget.content;
                  isEditEnabled = false;
                });
              },
              icon: const Icon(Icons.close)),
        ),
        Visibility(
          visible: !isEditEnabled && !widget.isNewNote,
          child: IconButton(
              onPressed: () {
                setState(() {
                  isEditEnabled = true;
                });
              },
              icon: const Icon(Icons.edit)),
        ),
      ]),
      body: Form(
        key: _formKey,
        child: ListView(padding: const EdgeInsets.all(30.0), children: [
          TextFormField(
            readOnly: isEditEnabled ? false : (widget.isNewNote ? false : true),
            controller: _titleController,
            decoration: const InputDecoration(
                hintText: 'Titulo',
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26))),
            style: const TextStyle(fontFamily: 'Indie', fontSize: 60),
          ),
          TextFormField(
            readOnly: isEditEnabled ? false : (widget.isNewNote ? false : true),
            controller: _contentController,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: 'Escribe algo aquí', border: InputBorder.none),
            maxLines: null,
            style: const TextStyle(fontFamily: 'Indie', fontSize: 30),
          )
        ]),
      ),
    );
  }
}
