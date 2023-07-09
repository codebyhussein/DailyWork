import 'package:flutter/material.dart';
import 'package:flutter_application_basic1/model/note_model.dart';

import 'package:hexcolor/hexcolor.dart';

import '../constants.dart';

class TaskTemplete extends StatelessWidget {
  TaskTemplete({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(note.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(note.description,
                        maxLines: 4,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: HexColor('#42A2C1'),
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 17,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: HexColor('#42A2C1'),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                EditButtomSheet(context);
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 17,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Center(
                        child: Text(note.time,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
