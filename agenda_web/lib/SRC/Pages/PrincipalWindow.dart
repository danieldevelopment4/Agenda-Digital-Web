// ignore_for_file: file_names

import 'package:agenda_web/SRC/Pages/Benefits.dart';
import 'package:agenda_web/SRC/Pages/Downloads.dart';
import 'package:agenda_web/SRC/Pages/Home.dart';
import 'package:agenda_web/SRC/Pages/Statistics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincipalWindow extends StatefulWidget {
  const PrincipalWindow({Key? key}) : super(key: key);

  static const String route = "Page";

  @override
  State<PrincipalWindow> createState() => _PrincipalWindowState();
}

class _PrincipalWindowState extends State<PrincipalWindow> {

  late TextStyle _textStyle;

  late List<Widget> _list;

  late ScrollController _scScroll;

  late Size size;

  late double _homeOffSet;
  late double _benefitsOffSet;
  late double _statsOffSet;
  late double _downloadOffSet;

  
  

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    _homeOffSet = 0;
    _benefitsOffSet = _homeOffSet + size.height;
    _statsOffSet = _benefitsOffSet + ((size.width > 1100) ? size.height : (size.width > 500) ? size.height * 4.3 : size.height * 1.7);
    _downloadOffSet = _statsOffSet + ((size.width > 1100 || size.width < 500) ? size.height : size.height * 2.2);

    

    _textStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width > 500) ? 40 : 15, 
      color: Colors.white, 
    );

    

    _list = <Widget>[Home(), Benefits(), Statistics(), Dowloads()];

    _scScroll = ScrollController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _page(),
          _menu(),
        ],
      ),
    );
  }

  Widget _menu() {
    return Container(
      color: const Color.fromRGBO(44, 47, 51, 0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // const Image(image: AssetImage("Files/DarkTheme.png")),
          TextButton(
              onPressed: () => _scroll(_homeOffSet),
              child: Text("Inicio", style: _textStyle)),
          TextButton(
              onPressed: () => _scroll(_benefitsOffSet),
              child: Text("Beneficios", style: _textStyle)),
          TextButton(
              onPressed: () => _scroll(_statsOffSet),
              child: Text("Estadisticas", style: _textStyle)),
          TextButton(
              onPressed: () => _scroll(_downloadOffSet),
              child: Text("Descargas", style: _textStyle)),
          TextButton(
              onPressed: () {},
              child: Icon(
                Icons.language,
                color: Colors.white,
                size: (size.width > 500) ? 40 : 15,
              )),
        ],
      ),
    );
  }

  _scroll(double index) {
    _scScroll.animateTo(index,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn
    ); //se despalza entre la ubicacion actual y la indicada mediante un proceso de animacion mas vistoso
    // scScroll.jumpTo(index);//teleport hasta la ubicacion, sin animacion, sin importar si hay otro scroll en proceso
  }

  Widget _page() {
    return ListView.builder(
        controller: _scScroll,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return _list[index];
        });
  }
  
}
