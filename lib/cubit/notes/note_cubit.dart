import 'package:bloc/bloc.dart';
import 'package:flutter_application_basic1/constants.dart';
import 'package:flutter_application_basic1/model/note_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  addNote(NoteModel note) {
    emit(AddNoteLoading());

    try {
      var noteboxes = Hive.box<NoteModel>(kNotesBox);
      noteboxes.add(note);
      emit(AddNoteSucces());
    } catch (e) {
      emit(AddNoteFailure(errorMassege: e.toString()));
    }
  }
}
