// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Size size;

  late TextStyle _titleStyle;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;

    _titleStyle = GoogleFonts.permanentMarker(
      fontSize: (size.width > 1000) ? 200 : (size.width > 500) ? 130 : 100,
      color: Colors.white,
    );

    return Stack(
      children: <Widget>[
        // const Image(image: AssetImage("Files/Images/DashBoard.jpg"))
        Container(
          color: const Color.fromRGBO(44, 47, 51, 1),
          width: size.width,
          height: size.height * 1,
        ),
        Container(
          height: size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(1, 1),
                  colors: <Color>[
                Color.fromRGBO(30, 91, 83, .6),
                Color.fromRGBO(204, 255, 170, .6),
              ])),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: (size.width > 1000) ? size.height * .1 : (size.width > 500) ? size.height * .02 : size.height * .3,
            ), //(size.height<500)?0:size.height*.18,
            Center(
              child: Text("Agenda\nDigital", style: _titleStyle),
            )
          ],
        )
      ],
    );
  }
}