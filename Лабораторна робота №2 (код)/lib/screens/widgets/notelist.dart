import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_everyday/cubits/notes_cubit/notes_cubit.dart';
import 'package:plan_everyday/models/note_model.dart';
import 'package:plan_everyday/screens/note_view.dart';

class NoteList extends StatelessWidget {
   const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: const [
          SizedBox(
            height: 5,
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NotesLoaded) {
          List<NoteModel> notes = state.notes;

          if (notes.isEmpty) {
            return Center(child: Text("No notes available"));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: NoteView(note: notes[index]),
                );
              },
            ),
          );
        } else if (state is NotesError) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return Container();
        }
      },
    );
  }
}

