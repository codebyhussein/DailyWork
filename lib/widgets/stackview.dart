import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class stackview extends StatelessWidget {
  const stackview({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.0,
          width: 400.0,
          decoration: BoxDecoration(
              color: HexColor('#42A2C1'),
              borderRadius: BorderRadius.circular(15.0)),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: 20.0, top: 90.0, left: 130.0, right: 130.0),
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('images/hussein.jpg'),
            ),
          ),
        ),
        const SizedBox(
          height: 7.0,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0, top: 220.0),
          child: Center(
            child: Text('Welcome Ya Hueesin',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [

        //   ],
        // )
        const Positioned(
          top: 50,
          left: 10,
          child: Text(
            'Notes',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Positioned(
            top: 50,
            right: 10,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 25,
                )))
      ],
    );
  }
}
