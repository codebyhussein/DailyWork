import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EditaskButtom extends StatelessWidget {
  EditaskButtom({super.key, required this.function});
  VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: HexColor('#42A2C1'), borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: MaterialButton(
          onPressed: () {
            function;
          },
          child: const Text(
            'Edit Task',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
