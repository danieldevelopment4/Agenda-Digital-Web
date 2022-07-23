// ignore_for_file: file_names

import 'package:agenda_web/SRC/Api/StatsRequest.dart';
import 'package:agenda_web/SRC/Logic/Management.dart';
import 'package:agenda_web/SRC/Logic/Provider.dart';
import 'package:agenda_web/SRC/Models/Stats.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {

  final StatsRequest _statsRequest = StatsRequest();
  late Management _management;
  late Size size;

  late TextStyle _textStyle;

  String users = "0";
  String downloads = "0";
  String numberOfRatings = "0";
  String rating = "0";

  void loadStats(){
    Stats stats = _management.statsRequest();
    users = stats.noStudens;
    downloads = stats.noDownloads;
    numberOfRatings = stats.noCalifications;
    rating = stats.calification;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _management = Provider.of(context);
    loadStats();

    _textStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width > 500) ? 40 : 15, 
      color: Colors.white, 
    );


    Widget user = Container(
      width: (size.width > 1100) ? 180 : (size.width > 500) ? 150 : 100,
      height: (size.width > 1100) ? 130 : (size.width > 500) ? 110 : 90,
      margin: const EdgeInsets.all(20),
      child: Column(
        //usuarios
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Usuarios:",
            style: _textStyle,
          ),
          Text(
            users.toString(),
            style: _textStyle,
          )
        ],
      ),
    );
    Widget download = Container(
        width: (size.width > 1100) ? 180 : (size.width > 500) ? 180 : 100,
        height: (size.width > 1100) ? 130 : (size.width > 500) ? 110 : 90,
        margin: const EdgeInsets.all(20),
        child: Column(
          //descargas
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Descargas:",
              style: _textStyle,
            ),
            Text(
              downloads.toString(),
              style: _textStyle,
            )
          ],
        ));
    Widget noRatings = Container(
        width: (size.width > 1100) ? 300  : (size.width > 500) ? 300 : 120,
        height: (size.width > 1100) ? 130 : (size.width > 500) ? 110 : 90,
        margin: const EdgeInsets.all(20),
        child: Column(
          //numero de calificaciones
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "No. Calificaciones:",
              style: _textStyle,
            ),
            Text(
              numberOfRatings.toString(),
              style: _textStyle,
            )
          ],
        ));
    Widget rate = Container(
        width: (size.width > 1100) ? 200 : (size.width > 500) ? 230 : 100,
        height: (size.width > 1100) ? 130 : (size.width > 500) ? 110 : 90,
        margin: const EdgeInsets.all(20),
        child: Column(
          //calificacion
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Calificacion:",
              style: _textStyle,
            ),
            Text(
              rating.toString(),
              style: _textStyle,
            )
          ],
        ));

    Widget stats = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // SizedBox(height: (size.width>1100)?size.height*.1:(size.width>500)?size.height*.15:size.height*.06),
        Text("Estadisticas", style: _textStyle),
        Flex(
          direction: (size.width > 1100) ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            user,
            download,
            noRatings,
            rate,
          ]
        ),
      ],
    );

    return Container(
      //fondo oscuro
      height: (size.width > 1100 || size.width < 500) ? size.height : size.height * 2.2,
      color: const Color.fromRGBO(44, 47, 51, 1),
      // padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      padding: const EdgeInsets.all(100),
      child: _container( 0, (size.width > 1100) ? 180 : (size.width > 500) ? size.height * .75 : size.height * .06, 0, stats),
    );
  }

  Widget _container(double width, double height, double margin, Widget child, ) {
    return Container(
      //cuadrado azul
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1, 1),
            colors: <Color>[
              Color.fromRGBO(30, 91, 83, .6),
              Color.fromRGBO(204, 255, 170, .6),
            ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

}