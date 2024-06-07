import 'package:flutter/material.dart';
import 'package:plan_everyday/models/note_model.dart';
import 'package:plan_everyday/screens/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note, this.onPressed});

  final void Function()? onPressed;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: const Color.fromRGBO(151, 187, 255, 1),
            title: const Text('Edit Note', 
              style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(0, 81, 145, 1),
                fontWeight:FontWeight.bold,
                ),
            ),
          ),
      backgroundColor: const Color.fromRGBO(27, 29, 84, 1),    
      body: EditNoteViewBody(
        note: note,
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: Color(0xFF1977F3),  
        shape: CircleBorder(),
        child: const Icon(Icons.check, color: Colors.white),
      ),*/
    );
  }
}