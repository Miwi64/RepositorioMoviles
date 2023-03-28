import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        const Expanded(
            flex: 1, child: Icon(Icons.sticky_note_2_outlined, size: 30)),
        Expanded(
          flex: 6,
          child: TextFormField(
            keyboardType: TextInputType.text,
            maxLength: 15,
            decoration: InputDecoration(
                prefix: Text('  '),
                counterText: '',
                hintText: 'Agregar comentario',
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        const BorderSide(color: Colors.lime, width: 2))),
          ),
        )
      ]),
    );
  }
}
