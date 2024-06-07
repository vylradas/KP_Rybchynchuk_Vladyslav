import 'package:flutter/material.dart';
import 'package:plan_everyday/models/note_model.dart';
import 'package:plan_everyday/screens/widgets/create_note_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);


  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text('Title', style: TextStyle(fontSize: 16,
            fontWeight: FontWeight.w500, color: Colors.white),),
          const SizedBox(
            height: 4,
            ),
          CreateNoteField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Description', style: TextStyle(fontSize: 16,
            fontWeight: FontWeight.w500, color: Colors.white),),
          const SizedBox(
            height: 4,
          ),
          CreateNoteField(
            onChanged: (value) {
              description = value;
            },
            hint: widget.note.description,
            maxLines: 5,
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.description = description ?? widget.note.description;
                  widget.note.save();

                  Navigator.pop(context);
                },
                backgroundColor: Color(0xFF1977F3),  
                shape: CircleBorder(),
                child: const Icon(Icons.check, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}