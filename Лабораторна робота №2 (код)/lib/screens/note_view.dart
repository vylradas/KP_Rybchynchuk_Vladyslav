import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_everyday/cubits/notes_cubit/notes_cubit.dart';
import 'package:plan_everyday/models/note_model.dart';
import 'package:plan_everyday/screens/edit_note_view.dart';

// Віджет для відображення окремої нотатки
class NoteView extends StatelessWidget {
  const NoteView({Key? key, required this.note}) : super(key: key);


  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromRGBO(36, 70, 132, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: ()
            {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context){
                  return EditNoteView(
                    note: note,
                );
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                color: _getColorForType(note.type),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              width: 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(note.title, 
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                        top: 5
                        ),
                      child: Text(
                        note.description, 
                        style: TextStyle(
                          color: Colors.white.withOpacity(.6),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 3),
                      child: IconButton(
                        onPressed: () {
                          // Видалення нотатки
                          note.delete();
                          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        }, 
                        icon: const Icon(
                          Icons.delete_outline_rounded, 
                          color: Color.fromARGB(255, 141, 137, 168),
                          size: 25,
                        ), 
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -12),
                    child: Container(child: Column(children: [
                      Divider(
                      thickness: 1.5, 
                      color: Color.fromRGBO(57, 88, 146, 1),
                      ),
                      Row( children: [
                        Text(note.dateValue, 
                          style: TextStyle(
                            color: Color.fromARGB(255, 32, 166, 255),
                            fontSize: 11,
                          ),
                        ),
                        SizedBox(width: 12,),
                        Text(note.timeValue,
                          style: TextStyle(
                            color: Color.fromARGB(255, 32, 166, 255),
                            fontSize: 11,
                          ),
                        )
                       ],          
                      ),
                    ],),),
                  )
              ] ),
            )
          )
        ],
      ),
    );
  }

   // Отримання кольору для відображення в залежності від типу нотатки
  Color _getColorForType(String type) {
    switch (type) {
      case 'Event':
        return Colors.green;
      case 'Task':
        return Colors.red;
      case 'Note':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}

