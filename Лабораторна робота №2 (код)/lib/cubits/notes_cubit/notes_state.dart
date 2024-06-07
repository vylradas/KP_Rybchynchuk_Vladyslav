part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

class NotesInitial extends NotesState {}
class NotesSuccess extends NotesState {}

class NotesLoading extends NotesState {}
class NotesLoaded extends NotesState {
  final List<NoteModel> notes;
  NotesLoaded(this.notes);
}

class NotesError extends NotesState {
  final String error;
  NotesError(this.error);
}
  
