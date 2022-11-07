// ignore_for_file: file_names

import 'package:agenda_web/SRC/Logic/Management.dart';
import 'package:agenda_web/SRC/Logic/Provider.dart';
import 'package:agenda_web/SRC/Models/DownloadModel.dart';
import 'package:agenda_web/SRC/Util/iconString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Dowloads extends StatefulWidget {
  const Dowloads({Key? key}) : super(key: key);

  @override
  State<Dowloads> createState() => _DowloadsState();
}

class _DowloadsState extends State<Dowloads> {

  late Size size;
  late TextStyle _textStyle;

  late Management _management;

  @override
  Widget build(BuildContext context) {
    
    size = MediaQuery.of(context).size;
    _management = Provider.of(context);

    _textStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width > 500) ? 40 : 15, 
      color: Colors.white, 
    );

    List<DownloadModel> downloadsDB = _management.getDownloadData();
    List<Widget> downloadList = List.empty(growable: true);
    for (int i = 0; i < downloadsDB.length; i++) {
      downloadList.add(_container((size.width > 1100 || size.width < 500) ? 233 : 600, (size.width > 1100) ? size.height * .7 : (size.width > 500) ? size.height * .9 : size.height * .35, 20, _instalers(downloadsDB[i])),);
    }

    return Container(
      height: (size.width > 1100) ? size.height : (size.width > 500) ? size.height * 5.4 : size.height * 2.2, //
      color: const Color.fromRGBO(44, 47, 51, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox( height: (size.width > 1100) ? size.height * .1 : (size.width > 500) ? size.height * .15 : size.height * .06),
          Text(translate("downloads.header"), style: _textStyle),
          Flex(
            direction: (size.width > 1100) ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: downloadList
          )
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

  Widget _instalers(DownloadModel download) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(translate("downloads.names."+download.operativeSystem), style: _textStyle),
        Icon(getIcon(download.operativeSystem), size: 80, color: Colors.white),
        Text(translate("downloads.status.title")+"\n"+ translate("downloads.status."+download.status), style: _textStyle, textAlign: TextAlign.center,),
        TextButton(
          onPressed: () => (download.url==null)?null:downloadInstaler(download.url!, download.id),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text((download.url==null)?"":translate("downloads.button"), style: _textStyle),
              Icon(
                (download.url==null)?Icons.do_disturb:Icons.download,
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
    }else{
      _management.addCounterDownload(index);
    }
  }

}