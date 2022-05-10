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
  

  double opacity = 0;
  late TextStyle _titleStyle;
  late TextStyle _textStyle;
  late TextStyle _subtextStyle;

  late List<Widget> _list;

  late ScrollController _scScroll;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    _titleStyle = GoogleFonts.permanentMarker(
      fontSize: (size.width>500)?140:100,
      color: Colors.white,
    );

    _textStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width>500)?30:14,
      color: Colors.white,
    );

    _subtextStyle = GoogleFonts.robotoCondensed(
      fontSize: (size.width>500)?20:14,
      color: Colors.white,
    );

    _list = <Widget>[
      _home(context),
      _benefits(context),
      _stats(context),
      _download(context)
    ];

    _scScroll = ScrollController();
    // _scScroll.addListener(() { //animacion oscurecimiento menu
    //   print(_scScroll.position.pixels.toString()+">"+(size.height/2).toString());
    //   if(_scScroll.position.pixels<size.height/2){
    //     opacity=_scScroll.position.pixels/(size.height/2);
    //   }else{
    //     opacity=0.8;
    //   }
    //   setState(() {});
    // });

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
            TextButton(onPressed: () => _scroll(size.height*0), child: Text("Inicio", style: _textStyle)),
            TextButton(onPressed: () => _scroll(size.height*1), child: Text("Beneficios", style: _textStyle)),
            TextButton(onPressed: () => _scroll(size.height*2), child: Text("Estadisticas", style: _textStyle)),
            TextButton(onPressed: () => _scroll(size.height*3), child: Text("Descargas", style: _textStyle)),
            TextButton(onPressed: () {}, child: Icon(Icons.language, color: Colors.white, size: (size.width>500)?40:14,)),
          ],
        ),
      )
    );
  }

  _scroll(double index){
    _scScroll.animateTo(index, duration: const Duration(seconds: 1), curve: Curves.easeIn);//se despalza entre la ubicacion actual y la indicada mediante un proceso de animacion mas vistoso
      // scScroll.jumpTo(index);//teleport hasta la ubicacion, sin animacion, sin importar si hay otro scroll en proceso
  }

  Widget _page(BuildContext context){
    return Expanded(
      child: ListView.builder(
        controller: _scScroll,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return _list[index];
        }
      )
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

    Widget organization = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(height: 20,),
        Icon(Icons.balance, color: Colors.white, size: (size.width>500)?60:14,),
        const SizedBox(height: 100,),
        Text(
          "Organizacion",
          style: _textStyle
        ),
        const SizedBox(height: 20,),
        Text(
          "Podras organizar tus horarios de manera eficiente para asi dejar de lado las preocupaciones, combate el deficid de atencion con nuestra modalidad de estudio integrada.\nTe ayudamso a explotar tu potencial",
          style: _subtextStyle,
          textAlign: TextAlign.center,//Justifica centrado
        ),
        const Expanded(child: SizedBox(),),
      ],
    );
    Widget freeSoftware = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(height: 20,),
        Icon(Icons.money_off, color: Colors.white, size: (size.width>500)?60:14,),
        const SizedBox(height: 100,),
        Text(
          "Software libre",
          style: _textStyle
        ),
        const SizedBox(height: 20,),
        Text(
          "Nuestro software siempre sera gratuito, queremos ayudar a todos aquellos que lo necesitan",
          style: _subtextStyle,
          textAlign: TextAlign.center,//Justifica centrado
        ),
        const Expanded(child: SizedBox(),),
      ],
    );
    Widget multiPlatform = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(height: 20,),
        Icon(Icons.devices, color: Colors.white, size: (size.width>500)?60:14,),
        const SizedBox(height: 100,),
        Text(
          "Multiplataforma",
          style: _textStyle,
        ),
        const SizedBox(height: 20,),
        Text(
          "Siendo facil de instalar buscamos apoyarte con tus estudios, por eso estamos listos para asistir desde una computadora o el movil",
          style: _subtextStyle,
          textAlign: TextAlign.center,//Justifica centrado
        ),
        const Expanded(child: SizedBox(),),
      ],
    );
    Widget easyUsage = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(height: 20,),
        Icon(Icons.document_scanner, color: Colors.white, size: (size.width>500)?60:14,),
        const SizedBox(height: 100,),
        Text(
          "Facil de usar",
          style: _textStyle
        ),
        const SizedBox(height: 20,),
        Text(
          "Hemos desarrollado la agenda digital con el fin de no enredarte mas la vida, por ello todas nuestras funciones son faciles de aprender a usar, aun asi, si lo deseas puedes consultar nuestra manual de usuario",
          style: _subtextStyle,
          textAlign: TextAlign.center,//Justifica centrado
        ),
        const Expanded(child: SizedBox(),),
      ],
    );

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
              _container(size.width*.2, size.height*.7, 20, organization),
              _container(size.width*.2, size.height*.7, 20, freeSoftware),
              _container(size.width*.2, size.height*.7, 20, multiPlatform),
              _container(size.width*.2, size.height*.7, 20, easyUsage),
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
      child: _container(0,1.5, 0, data),
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
                _container(size.width*.16, size.height*.5, 20, _instalers("Windows", CustomeIcons.windows, "...")),
                _container(size.width*.16, size.height*.5, 20, _instalers("Linux", CustomeIcons.linux, "...")),
                _container(size.width*.16, size.height*.5, 20, _instalers("MAC", Icons.apple, "...")),
                _container(size.width*.16, size.height*.5, 20, _instalers("Android", CustomeIcons.android, "...")),
                _container(size.width*.16, size.height*.5, 20, _instalers("IOS", Icons.apple, "...")),
              ]
            ),
          ]
        ),
    );
  }

  Widget _container(double width, double height, double margin, Widget child,){
    return Container(//cuadrado azul
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: FractionalOffset(0,0),
          end: FractionalOffset(1,1),
          colors: <Color>[
            Color.fromRGBO(30, 91, 83, .6),
                Color.fromRGBO(204, 255, 170, .6),
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