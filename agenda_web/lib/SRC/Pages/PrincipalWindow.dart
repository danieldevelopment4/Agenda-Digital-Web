// ignore_for_file: file_names

import 'package:agenda_web/SRC/Pages/Benefits.dart';
import 'package:agenda_web/SRC/Pages/Downloads.dart';
import 'package:agenda_web/SRC/Pages/Home.dart';
import 'package:agenda_web/SRC/Pages/Statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincipalWindow extends StatefulWidget {
  const PrincipalWindow({Key? key}) : super(key: key);

  static const String route = "Page";

  @override
  State<PrincipalWindow> createState() => _PrincipalWindowState();
}

class _PrincipalWindowState extends State<PrincipalWindow> {

  late Size size;

  late TextStyle _textStyle;
  late TextStyle _subtextStyle;

  late ScrollController _scScroll;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

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
    _subtextStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width > 500) ? 25 : 10, 
      color: Colors.white, 
    );

    _scScroll = ScrollController();
    return Scaffold(
      key: _scaffold,
      endDrawer: _drawer(),
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
              child: Text(translate("menu.home"), style: _textStyle)),
          TextButton(
              onPressed: () => _scroll(_benefitsOffSet),
              child: Text(translate("menu.benefits"), style: _textStyle)),
          TextButton(
              onPressed: () => _scroll(_statsOffSet),
              child: Text(translate("menu.stats"), style: _textStyle)),
          TextButton(
              onPressed: () => _scroll(_downloadOffSet),
              child: Text(translate("menu.downloads"), style: _textStyle)),
          TextButton(
              onPressed: () {
                _scaffold.currentState!.openEndDrawer();
              },
              child: Icon(
                Icons.translate,
                color: Colors.white,
                size: (size.width > 500) ? 40 : 15,
              )),
        ],
      ),
    );
  }

  Widget _drawer(){
    return Drawer(
      backgroundColor: const Color.fromRGBO(44, 47, 51, 1),
      child: Column(
        children: <Widget>[
          Text(
            translate("language.title"),
            style: _textStyle,
          ),
          const Divider(thickness: 1, color: Colors.white,),
          TextButton(
            child: Text(
              translate("language.names.en"),
              style: _subtextStyle,
            ),
            onPressed:(){
              changeLocale(context, 'en');
              Navigator.pop(context);
            }, 
          ),
          TextButton(
            child: Text(
              translate("language.names.es"),
              style: _subtextStyle,
            ),
            onPressed:(){
              changeLocale(context, 'es');
              Navigator.pop(context);
            }, 
          ),
          // TextButton(
          //   child: Text(
          //     translate("language.names.fr"),
          //     style: _subtextStyle,
          //   ),
          //   onPressed:(){
          //     changeLocale(context, 'fr');
          //     Navigator.pop(context);
          //   }, 
          // ),
          // TextButton(
          //   child: Text(
          //     translate("language.names.pt"),
          //     style: _subtextStyle,
          //   ),
          //   onPressed:(){
          //     changeLocale(context, 'pt');
          //     Navigator.pop(context);
          //   }, 
          // ),
          // TextButton(
          //   child: Text(
          //     translate("language.names.de"),
          //     style: _subtextStyle,
          //   ),
          //   onPressed:(){
          //     changeLocale(context, 'de');
          //     Navigator.pop(context);
          //   }, 
          // ),
          // TextButton(
          //   child: Text(
          //     translate("language.names.zh"),
          //     style: _subtextStyle,
          //   ),
          //   onPressed:(){
          //     changeLocale(context, 'zh');
          //     Navigator.pop(context);
          //   }, 
          // ),
          // TextButton(
          //   child: Text(
          //     translate("language.names.ja"),
          //     style: _subtextStyle,
          //   ),
          //   onPressed:(){
          //     changeLocale(context, 'ja');
          //     Navigator.pop(context);
          //   }, 
          // ),
          // TextButton(
          //   child: Text(
          //     translate("language.names.ru"),
          //     style: _subtextStyle,
          //   ),
          //   onPressed:(){
          //     changeLocale(context, 'ru');
          //     Navigator.pop(context);
          //   }, 
          // ),
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
    // ignore: prefer_const_constructors
    List<Widget> pageList = <Widget>[Home(), Benefits(), Statistics(), Dowloads()];
    return ListView.builder(
        controller: _scScroll,
        itemCount: pageList.length,
        itemBuilder: (context, index) {
          return pageList[index];
        });
  }
  
}
