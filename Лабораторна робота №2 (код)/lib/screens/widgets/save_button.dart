import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({
    super.key, 
    this.onPressed, 
    this.isLoading = false,
  });

  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Color(0xFF1977F3),
      child: isLoading 
        ? const CircularProgressIndicator(
          color: Colors.white,
        ) 
        : const Icon(Icons.check, color: Colors.white),
      shape: CircleBorder(),
    );
  }
}
