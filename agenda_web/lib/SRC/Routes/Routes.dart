import 'package:agenda_web/SRC/Pages/Home.dart';
import 'package:agenda_web/SRC/Pages/page404.dart';
import 'package:flutter/material.dart';


Map<String,WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    Home.route : (BuildContext context) => Home(),
  };
}

WidgetBuilder error404(){
  return (BuildContext context) => const Page404();
}
