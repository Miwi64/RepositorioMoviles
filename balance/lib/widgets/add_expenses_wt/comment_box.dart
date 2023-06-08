import 'package:balance/models/combined_model.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  final CombinedModel combinedModel;
  const CommentBox({super.key, required this.combinedModel});

  @override
  Widget build(BuildContext context) {
    String _text = '';
    _text = combinedModel.comment;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        const Expanded(
            flex: 1, child: Icon(Icons.sticky_note_2_outlined, size: 30)),
        Expanded(
          flex: 6,
          child: TextFormField(
            initialValue: _text,
            keyboardType: TextInputType.text,
            maxLength: 15,
            decoration: InputDecoration(
                prefix: const Text('  '),
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
            onChanged: (texto) {
              combinedModel.comment = texto;
            },
          ),
        ),
      ]),
    );
  }
}
