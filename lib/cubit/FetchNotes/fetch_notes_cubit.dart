import 'package:bloc/bloc.dart';
import 'package:flutter_application_basic1/model/note_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'fetch_notes_state.dart';

class FetchNotesCubit extends Cubit<FetchNotesState> {
  FetchNotesCubit() : super(FetchNotesInitial());
  List<NoteModel>? notes;
  fetchNotes() {
    try {
      var notesBox = Hive.box<NoteModel>('notes_box');
      notes = notesBox.values.toList();
    } catch (e) {
      emit(FetchNotesfaliure('error${e.toString()}'));
    }
  }
}
