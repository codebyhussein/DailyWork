part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class AddNoteLoading extends NoteState {}

class AddNoteSucces extends NoteState {}

class AddNoteFailure extends NoteState {
  String? errorMassege;

  AddNoteFailure({required this.errorMassege});
}
