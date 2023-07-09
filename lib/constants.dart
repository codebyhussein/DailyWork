import 'package:flutter/material.dart';
import 'package:flutter_application_basic1/cubit/notes/note_cubit.dart';
import 'package:flutter_application_basic1/model/note_model.dart';
import 'package:flutter_application_basic1/widgets/EditTaskButtom.dart';
import 'package:flutter_application_basic1/widgets/addTaskButtom.dart';
import 'package:flutter_application_basic1/widgets/defultTextFormFiled.dart';
import 'package:flutter_application_basic1/widgets/timeWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class defultText extends StatelessWidget {
  defultText({super.key, required this.text_title});
  String text_title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(text_title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold)),
    );
  }
}

Future<dynamic> EditButtomSheet(BuildContext context) {
  GlobalKey<FormState>? formkey;
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var timecontroller = TextEditingController();
  return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0.0,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: HexColor('#D9D9D9'),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocConsumer<NoteCubit, NoteState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  Form(
                    key: formkey,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          defultTextFormFiled(
                            maxline: 1,
                            typeofKeyword: TextInputType.text,
                            title: 'Edit Your Task Title',
                            IconinText: const Icon(Icons.title),
                            textwillshow: 'Please Edit your Task Title ',
                            nameContoller: titlecontroller,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          timeWidgets(timecontroller: timecontroller),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defultTextFormFiled(
                            maxline: 5,
                            hight: 120,
                            typeofKeyword: TextInputType.text,
                            title: 'Edit Description Task',
                            IconinText: const Icon(Icons.description),
                            textwillshow: 'Please Edit your  Description Task ',
                            nameContoller: descriptioncontroller,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          EditaskButtom(
                            function: () {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      });
}

Future<dynamic> AddButtomSheet(BuildContext context) {
  GlobalKey<FormState>? formkey;
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var timecontroller = TextEditingController();
  return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0.0,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: HexColor('#D9D9D9'),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocConsumer<NoteCubit, NoteState>(
            listener: (context, state) {
              if (state is AddNoteFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.errorMassege!,
                        style: const TextStyle(color: Colors.white))));
              }
              if (state is AddNoteSucces) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text("done", style: TextStyle(color: Colors.white))));
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
                child: Column(
                  children: [
                    Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            defultTextFormFiled(
                              maxline: 1,
                              typeofKeyword: TextInputType.text,
                              title: 'Add Your Task Title',
                              IconinText: const Icon(Icons.title),
                              textwillshow: 'Please Add your Task Title ',
                              nameContoller: titlecontroller,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            timeWidgets(
                              timecontroller: timecontroller,
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            defultTextFormFiled(
                              maxline: 5,
                              hight: 120,
                              typeofKeyword: TextInputType.text,
                              title: 'Add Description Task',
                              IconinText: const Icon(Icons.description),
                              textwillshow:
                                  'Please Add your  Description Task ',
                              nameContoller: descriptioncontroller,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AddTaskButtom(
                              function: () async {
                                var noteDetails = NoteModel(
                                    title: titlecontroller.text,
                                    description: descriptioncontroller.text,
                                    time: timecontroller.text);
                                await BlocProvider.of<NoteCubit>(context)
                                    .addNote(noteDetails);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      });
}

const String kNotesBox = 'notes_box';
