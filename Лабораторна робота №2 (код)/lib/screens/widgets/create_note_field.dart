import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Віджет для введення тексту з можливістю його зміни
class CreateNoteField extends StatelessWidget {
  const CreateNoteField(
    {super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged});

  final String hint;
  final int maxLines;

  final void Function(String?)? onSaved;

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true) {
          return 'Field is required';
        } 
        else {
          return null;
        }
      },
      // Стиль тексту у віджеті
      style: TextStyle(color: Colors.white),
      // Колір курсора
      cursorColor: Color.fromARGB(255, 32, 166, 255),
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 56, 80, 156), 
          fontWeight: FontWeight.w400,
        ),       
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(Color.fromARGB(255, 32, 166, 255)),
      ),
    );
  }

  // Створення границі текстового поля
  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      )
    ); 
  }
}


