// ignore_for_file: file_names

import 'package:agenda_web/SRC/Api/DownloadRequest.dart';
import 'package:agenda_web/SRC/Logic/Management.dart';
import 'package:agenda_web/SRC/Logic/Provider.dart';
import 'package:agenda_web/SRC/Models/Download.dart';
import 'package:agenda_web/SRC/Util/iconString.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Dowloads extends StatefulWidget {
  const Dowloads({Key? key}) : super(key: key);

  @override
  State<Dowloads> createState() => _DowloadsState();
}

class _DowloadsState extends State<Dowloads> {

  final DownloadRequest _downloadRequest = DownloadRequest();
  late Size size;
  late TextStyle _textStyle;

  late Management _management;
  late List<Download> _downloads;

  void loadStats(){
    _downloads = _management.downloadRequest();
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

    return Container(
      height: (size.width > 1100) ? size.height : (size.width > 500) ? size.height * 5.4 : size.height * 2.2, //
      color: const Color.fromRGBO(44, 47, 51, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox( height: (size.width > 1100) ? size.height * .1 : (size.width > 500) ? size.height * .15 : size.height * .06),
          Text("Descargas", style: _textStyle),
          Flex(
            direction: (size.width > 1100) ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _container((size.width > 1100 || size.width < 500) ? 233 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, _instalers(0)),
              _container((size.width > 1100 || size.width < 500) ? 233 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, _instalers(1)),
              _container((size.width > 1100 || size.width < 500) ? 233 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, _instalers(2)),
              _container((size.width > 1100 || size.width < 500) ? 233 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, _instalers(3)),
              _container((size.width > 1100 || size.width < 500) ? 233 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, _instalers(4)),
            ]
          ),
        ]
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

  Widget _instalers(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(_downloads[index].operativeSystem, style: _textStyle),
        Icon(getIcon(_downloads[index].operativeSystem), size: 80, color: Colors.white),
        Text("Estado: \n" + _downloads[index].status, style: _textStyle, textAlign: TextAlign.center,),
        TextButton(
          onPressed: () => (_downloads[index].url==null)?null:downloadInstaler(_downloads[index].url!, index),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Descargar", style: _textStyle),
              const Icon(
                Icons.download,
                color: Colors.white,
              ),
            ],
          )
        ),
      ],
    );
  }

  Future<void> downloadInstaler(String url, int index) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
    _management.addCounterDownload(index);
  }

}