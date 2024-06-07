import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_everyday/cubits/notes_cubit/notes_cubit.dart';
import 'package:plan_everyday/models/note_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  void searchNotes(String query) {
    final notesCubit = BlocProvider.of<NotesCubit>(context);
    notesCubit.searchNotes(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(151, 187, 255, 1),
        title: TextField(
          onChanged: (value) {
            setState(() {
              query = value;
            });
            searchNotes(value);
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      backgroundColor: const Color.fromRGBO(27, 29, 84, 1),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NotesLoaded) {
            List<NoteModel> notes = state.notes;

            if (notes.isEmpty) {
              return Center(child: Text("No notes found"));
            }

            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index].title, style: TextStyle(color: Colors.white)),
                  subtitle: Text(notes[index].description, style: TextStyle(color: Colors.white70)),
                );
              },
            );
          } else if (state is NotesError) {
            return Center(child: Text('Error: ${state.error}', style: TextStyle(color: Colors.red)));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
