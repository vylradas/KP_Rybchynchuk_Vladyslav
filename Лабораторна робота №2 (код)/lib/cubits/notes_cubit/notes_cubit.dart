import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:plan_everyday/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      if (notesBox.isNotEmpty) {
        notes = notesBox.values.toList();
        print("Fetched notes: ${notes?.length}"); // Логування кількості нотаток
      } else {
        notes = [];
        print("No notes found"); // Логування, якщо нотатки відсутні
      }
      emit(NotesLoaded(notes!));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  searchNotes(String query) {
    if (notes != null) {
      final filteredNotes = notes!.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
               note.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(NotesLoaded(filteredNotes));
    } else {
      emit(NotesError('Notes not loaded'));
    }
  }
}
