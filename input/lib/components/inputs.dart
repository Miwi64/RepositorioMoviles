import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  final String? labelNombre;
  final bool ocultarTexto;
  final TextInputType tipoTeclado;
  final int? maximaLongitud;
  final Color color;
  final String? textoAyuda;
  final String? hintText;
  final String? textoError;
  final Icon? icono;

  const Inputs(
      {super.key,
      this.labelNombre,
      this.ocultarTexto = false,
      this.tipoTeclado = TextInputType.text,
      this.maximaLongitud,
      this.color = Colors.teal,
      this.textoAyuda,
      this.hintText,
      this.icono,
      this.textoError});

  @override
  State<Inputs> createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        autocorrect: false,
        obscureText: widget.ocultarTexto,
        obscuringCharacter: '_',
        autofocus: false,
        keyboardType: widget.tipoTeclado,
        maxLength: widget.maximaLongitud,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.none,
        cursorColor: widget.color,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            helperText: widget.textoAyuda,
            labelText: widget.labelNombre,
            alignLabelWithHint: true,
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelStyle: TextStyle(color: widget.color, fontSize: 20),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            hintText: widget.hintText,
            errorText: widget.textoError,
            prefixIcon: widget.icono,
            focusColor: widget.color,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: widget.color, width: 3))),
        style: TextStyle(fontSize: 18, color: widget.color),
      ),
    );
  }
}
