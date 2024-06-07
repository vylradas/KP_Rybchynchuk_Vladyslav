import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:plan_everyday/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:plan_everyday/cubits/notes_cubit/notes_cubit.dart';
import 'package:plan_everyday/screens/widgets/create_note_form.dart';

class CreateNotePage extends StatelessWidget {
  CreateNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 187, 255, 1),
        title: const Text(
          'New Note',
          style: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(0, 81, 145, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(27, 29, 84, 1),
      body: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {}
        
            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
                child:  const SingleChildScrollView(
                  child: CreateNoteForm(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
