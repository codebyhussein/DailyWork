import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class defultTextFormFiled extends StatelessWidget {
  defultTextFormFiled({
    super.key,
    required this.IconinText,
    required this.nameContoller,
    required this.textwillshow,
    required this.title,
    required this.typeofKeyword,
    required this.maxline,
    @required this.hight,
  });
  String title;
  Icon IconinText;
  String textwillshow;
  var nameContoller;
  TextInputType? typeofKeyword;
  String textofFiled = '';
  Function? function;
  int? maxline;
  double? hight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23.0, right: 26.0),
      child: Container(
        height: hight == 60 ? 60 : hight,
        width: 326.0,
        decoration: BoxDecoration(
          color: HexColor('#D9D9D9'),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextFormField(
          onTap: () {
            function;
          },
          keyboardType: typeofKeyword,
          maxLines: maxline,
          showCursor: true,
          enableSuggestions: true,
          controller: nameContoller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor('#42A2C1')),
                borderRadius: BorderRadius.circular(10.0)),
            labelText: ('$title'),
            suffixIcon: IconinText,
            suffixIconColor: HexColor('#42A2C1'),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return '$textwillshow';
            }
            return null;
          },
        ),
      ),
    );
    ;
  }
}
