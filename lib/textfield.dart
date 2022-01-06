import 'package:flutter/material.dart';

class TextFieldX extends StatelessWidget {
  final Color color;
  final FocusNode textFieldFocus;
  const TextFieldX(this.color, this.textFieldFocus);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
      child: TextField(
        autofocus: true,
        focusNode: textFieldFocus,
        decoration: InputDecoration(fillColor: Colors.black),
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}