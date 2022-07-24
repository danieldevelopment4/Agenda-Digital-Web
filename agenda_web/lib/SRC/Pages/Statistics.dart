// ignore_for_file: file_names

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

  late Management _management;
  late Size size;

  late TextStyle _textStyle;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _management = Provider.of(context);

    _textStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width > 500) ? 40 : 15, 
      color: Colors.white, 
    );

    Widget stats = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // SizedBox(height: (size.width>1100)?size.height*.1:(size.width>500)?size.height*.15:size.height*.06),
        Text("Estadisticas", style: _textStyle),
        FutureBuilder(
          future: _management.statsRequest(),
          builder: (BuildContext context, AsyncSnapshot<Stats> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 7,
                );
            }else{
              return Flex(
                direction: (size.width > 1100) ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _user(snapshot.data!.noStudens),
                  _download(snapshot.data!.noDownloads),
                  _noRatings(snapshot.data!.noCalifications),
                  _rate(snapshot.data!.calification),
                ]
              );
            }
          },
        )
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

  Widget _user(String data){
    return Container(
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
            data,
            style: _textStyle,
          )
        ],
      ),
    );
  }

  Widget _download(String data){
    return Container(
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
            data,
            style: _textStyle,
          )
        ],
      )
    );
  }

  Widget _noRatings(String data){
    return Container(
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
            data,
            style: _textStyle,
          )
        ],
      )
    );
  }

  Widget _rate(String data){
    return Container(
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
            data,
            style: _textStyle,
          )
        ],
      )
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