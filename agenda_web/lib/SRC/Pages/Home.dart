import 'package:flutter/material.dart';

import 'package:agenda_web/SRC/Util/CustomeIcons.dart';

import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const String route = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  double opacity = 0.8;
  late TextStyle _titleStyle;
  late TextStyle _textStyle;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    _titleStyle = GoogleFonts.permanentMarker(
      fontSize: (size.width>500)?140:100,
      color: Colors.white,
      // fontWeight: FontWeight.bold,
    );

    _textStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width>500)?30:14,
      color: Colors.white,
      // fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _page(context),
          _menu(context),
          
        ],
      ),
    );
  }

  Widget _menu(BuildContext context){

    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        color: Color.fromRGBO(44, 47, 51, opacity),
        height: size.height*.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // const Image(image: AssetImage("Files/DarkTheme.png")), 
            TextButton(onPressed: (){}, child: Text("Inicio", style: _textStyle)),
            TextButton(onPressed: (){}, child: Text("Beneficios", style: _textStyle)),
            TextButton(onPressed: (){}, child: Text("Estadisticas", style: _textStyle)),
            TextButton(onPressed: (){}, child: Text("Descargas", style: _textStyle)),
            TextButton(onPressed: (){}, child: Icon(Icons.language, color: Colors.white, size: (size.width>500)?40:14,)),
          ],
        ),
      )
    );
  }

  Widget _page(BuildContext context){
    return Expanded(
      child: ListView(
        children: <Widget>[
          _home(context),
          _benefits(context),
          _stats(context),
          _download(context)
        ],
      ),
    );
  }

  Widget _home(BuildContext context){

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        const Image(image: AssetImage("Files/Images/DashBoard.jpg")),
        Container(
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset(0,0),
              end: FractionalOffset(1,1),
              colors: <Color>[
                Color.fromRGBO(30, 91, 83, .6),
                Color.fromRGBO(204, 255, 170, .6),
              ]
            )
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: size.height*.18,),
            Center(
              child: Text(
                "Agenda\nDigital",
                style: _titleStyle
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _benefits(BuildContext context){

    final size = MediaQuery.of(context).size;

    Widget organization = Column();

    return Container(
      height: size.height,
      color: const Color.fromRGBO(44, 47, 51, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "¿Que beneficios ofrecemos?", 
            style: _textStyle
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _container(size.width*.2, size.height*.6, 0, .6, organization),
              _container(size.width*.2, size.height*.6, 0, .6, organization),
              _container(size.width*.2, size.height*.6, 0, .6, organization),
              _container(size.width*.2, size.height*.6, 0, .6, organization),
            ]
          ),
        ],
      ),
    );
  }

  Widget _stats(BuildContext context){

    final size = MediaQuery.of(context).size;

    int usuers = 0;
    int downloads = 0;
    int numberOfRatings = 0;
    double rating = 0;

    Widget data =Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "Estadisticas", 
          style: _textStyle
        ),
        Row(//estadisticas
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Usuarios:",
                  style: _textStyle,
                ),
                Text(
                  usuers.toString(),
                  style: _textStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Descargas:",
                  style: _textStyle,
                ),
                Text(
                  downloads.toString(),
                  style: _textStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "N° calificaciones:",
                  style: _textStyle,
                ),
                Text(
                  numberOfRatings.toString(),
                  style: _textStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Calificacion:",
                  style: _textStyle,
                ),
                Text(
                  rating.toString()+"/5",
                  style: _textStyle,
                ),
              ],
            ),
          ],
        ),
      ]
    );
          
    return Container(//fondo oscuro
      height: size.height,
      color: const Color.fromRGBO(44, 47, 51, 1),
      // padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      padding: const EdgeInsets.all(100),
      child: _container(0,1.5, 0, .6, data),
    );
  }

  Widget _download(BuildContext context){

    final size = MediaQuery.of(context).size;

    

    return Container(
      height: size.height,
      color: const Color.fromRGBO(44, 47, 51, 1),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "Descargas", 
              style: _textStyle
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _container(size.width*.16, size.height*.5, 20, .6, _instalers("Windows", CustomeIcons.windows, "...")),
                _container(size.width*.16, size.height*.5, 20, .6, _instalers("Linux", CustomeIcons.linux, "...")),
                _container(size.width*.16, size.height*.5, 20, .6, _instalers("MAC", Icons.apple, "...")),
                _container(size.width*.16, size.height*.5, 20, .6, _instalers("Android", CustomeIcons.android, "...")),
                _container(size.width*.16, size.height*.5, 20, .6, _instalers("IOS", Icons.apple, "...")),
              ]
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     _container(size.width*.3, size.height*.5, 20, .6, _instalers("Android", CustomeIcons.android, "...")),
            //     _container(size.width*.3, size.height*.5, 20, .6, _instalers("IOS", Icons.apple, "...")),
            //   ]
            // )
          ]
        ),
    );
  }

  Widget _container(double width, double height, double margin, double opacity, Widget child,){
    return Container(//cuadrado azul
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const FractionalOffset(0,0),
          end: const FractionalOffset(1,1),
          colors: <Color>[
            Color.fromRGBO(1, 72, 113, opacity),
            Color.fromRGBO(215, 237, 226, opacity),
          ]
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }  

  Widget _instalers(String so, IconData icon, String date){
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(so, style: _textStyle),
        Icon(icon, size: 80, color:Colors.white),
        Text("Fecha: "+date, style: _textStyle),
        TextButton(
          onPressed: null, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Descargar", style: _textStyle),
              const Icon(Icons.download, color: Colors.white,),
            ],
          )
        ),
      ],
    );
  }

}