import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class timeWidgets extends StatelessWidget {
  const timeWidgets({
    super.key,
    required this.timecontroller,
  });

  final TextEditingController timecontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#D9D9D9'),
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 60.0,
      width: 326.0,
      child: TextFormField(
        onTap: () {
          showTimePicker(context: context, initialTime: TimeOfDay.now()).then(
              (value) =>
                  {timecontroller.text = value!.format(context).toString()});
        },
        keyboardType: TextInputType.datetime,
        showCursor: true,
        enableSuggestions: true,
        controller: timecontroller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: ('Text time'),
          suffixIcon: const Icon(Icons.watch_later_outlined),
          suffixIconColor: HexColor('#42A2C1'),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please inter the time of the task';
          }
          return null;
        },
      ),
    );
  }
}
