part of 'fetch_notes_cubit.dart';

@immutable
abstract class FetchNotesState {}

class FetchNotesInitial extends FetchNotesState {}

class FetchNotesSucsess extends FetchNotesState {
  final List<NoteModel> notes;

  FetchNotesSucsess(this.notes);
}

class FetchNotesfaliure extends FetchNotesState {
  final String errorMassege;

  FetchNotesfaliure(this.errorMassege);
}
