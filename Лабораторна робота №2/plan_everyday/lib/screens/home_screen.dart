import 'package:flutter/material.dart';
import 'package:plan_everyday/models/note_model.dart';
import 'package:plan_everyday/screens/create_note.dart';
import 'package:plan_everyday/screens/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan Everyday"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (contex, index){
          return NoteCard(note: notes[index], index: index, onNoteDeleted:onNoteDeleted);
        },
      ), 

      backgroundColor: const Color.fromRGBO(27, 29, 84, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateNote(onNewNoteCreated: onNewNoteCreated,)));    
        },
        child: const Icon(Icons.add),
        shape: CircleBorder(), 
        ),
    );
  }

  void onNewNoteCreated(Note note){
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index){
    notes.removeAt(index);
    setState(() {});
  }
}