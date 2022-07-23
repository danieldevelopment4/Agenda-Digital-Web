// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Benefits extends StatefulWidget {
  const Benefits({Key? key}) : super(key: key);

  @override
  State<Benefits> createState() => _BenefitsState();
}

class _BenefitsState extends State<Benefits> {

  late Size size;

  late TextStyle _textStyle;
  late TextStyle _subtextStyle;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    
    _textStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width > 500) ? 40 : 15, 
      color: Colors.white, 
    );

    _subtextStyle = GoogleFonts.robotoCondensed( 
      fontSize: (size.width > 500) ? 20 : 14, 
      color: Colors.white, 
    );

    Widget organization = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Icon(
          Icons.balance,
          color: Colors.white,
          size: (size.width > 500) ? 60 : 45,
        ),
        SizedBox(
          height: (size.width > 1100) ? 100 : 50,
        ), //(size.width>1100)?size.height:size.height*1.7
        Text("Organizacion", style: _textStyle),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Podras organizar tus horarios de manera eficiente para asi dejar de lado las preocupaciones, combate el deficid de atencion con nuestra modalidad de estudio integrada.\nTe ayudamso a explotar tu potencial",
          style: _subtextStyle,
          textAlign: TextAlign.center, //Justifica centrado
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
    Widget freeSoftware = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Icon(
          Icons.money_off,
          color: Colors.white,
          size: (size.width > 500) ? 60 : 45,
        ),
        SizedBox(
          height: (size.width > 1100) ? 100 : 50,
        ),
        Text("Software libre", style: _textStyle),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Nuestro software siempre sera gratuito, queremos ayudar a todos aquellos que lo necesitan",
          style: _subtextStyle,
          textAlign: TextAlign.center, //Justifica centrado
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
    Widget multiPlatform = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Icon(
          Icons.devices,
          color: Colors.white,
          size: (size.width > 500) ? 60 : 45,
        ),
        SizedBox(
          height: (size.width > 1100) ? 100 : 50,
        ),
        Text(
          "Multiplataforma",
          style: _textStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Siendo facil de instalar buscamos apoyarte con tus estudios, por eso estamos listos para asistir desde una computadora o el movil",
          style: _subtextStyle,
          textAlign: TextAlign.center, //Justifica centrado
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );
    Widget easyUsage = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Icon(
          Icons.document_scanner,
          color: Colors.white,
          size: (size.width > 500) ? 60 : 45,
        ),
        SizedBox(
          height: (size.width > 1100) ? 100 : 50,
        ),
        Text("Facil de usar", style: _textStyle),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Hemos desarrollado la agenda digital con el fin de no enredarte mas la vida, por ello todas nuestras funciones son faciles de aprender a usar, aun asi, si lo deseas puedes consultar nuestra manual de usuario",
          style: _subtextStyle,
          textAlign: TextAlign.center, //Justifica centrado
        ),
        const Expanded(
          child: SizedBox(),
        ),
      ],
    );

    return Container(
      height: (size.width > 1100) ? size.height : (size.width > 500) ? size.height * 4.3 : size.height * 1.7, //
      color: const Color.fromRGBO(44, 47, 51, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: (size.width > 1100) ? size.height * .1 : (size.width > 500) ? size.height * .15 : size.height * .06),
          Text("¿Que beneficios ofrecemos?", style: _textStyle),
          Flex(
            direction: (size.width > 1100) ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _container( (size.width > 1100 || size.width < 500) ? 273 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, organization),
              _container( (size.width > 1100 || size.width < 500) ? 273 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, freeSoftware),
              _container( (size.width > 1100 || size.width < 500) ? 273 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, multiPlatform),
              _container( (size.width > 1100 || size.width < 500) ? 273 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, easyUsage),
            ]
          ),
        ],
      ),
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