import 'package:flutter/material.dart';
import 'package:flutter_application_basic1/constants.dart';
import 'package:flutter_application_basic1/cubit/FetchNotes/fetch_notes_cubit.dart';
import 'package:flutter_application_basic1/model/note_model.dart';
import 'package:flutter_application_basic1/widgets/stackview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/tasktemplete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<FetchNotesCubit>(context).fetchNotes();
    List<NoteModel> notes = BlocProvider.of<FetchNotesCubit>(context).notes!;
    print(notes.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#656976'),
      body: BlocBuilder<FetchNotesCubit, FetchNotesState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<FetchNotesCubit>(context).notes!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              stackview(),
              defultText(text_title: 'Tasks list'),
              Container(
                height: 450,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return TaskTemplete(
                        note: notes[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: notes.length),
              )
            ],
          );
        },
      ),
      floatingActionButton: CircleAvatar(
        radius: 25,
        backgroundColor: HexColor('#42A2C1'),
        child: IconButton(
          onPressed: () {
            AddButtomSheet(context);
          },
          icon: Icon(Icons.add),
          color: Colors.white,
          iconSize: 30,
        ),
      ),
    );
  }
}
