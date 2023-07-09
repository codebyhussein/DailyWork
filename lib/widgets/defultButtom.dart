import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Screens/auth/registerScreens.dart';

class defultButtom extends StatelessWidget {
  const defultButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 78.0),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: HexColor("#42A2C1")),
            child: Builder(
                builder: (context) => Center(
                        child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (((context) => RegisterScreen()))));
                      },
                      child: const Text(
                        'Get started',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )))));
  }
}
