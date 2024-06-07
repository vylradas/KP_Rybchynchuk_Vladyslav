part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errMessage;

  AddNoteFailure(this.errMessage); 
}

class AddNoteTypeSelected extends AddNoteState {
  final String type;
  AddNoteTypeSelected(this.type);
}

class AddNoteDateSelected extends AddNoteState {
  final String date;
  AddNoteDateSelected(this.date);
}

class AddNoteTimeSelected extends AddNoteState {
  final String time;
  AddNoteTimeSelected(this.time);
}
