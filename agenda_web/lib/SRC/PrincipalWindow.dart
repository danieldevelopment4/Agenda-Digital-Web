import 'package:flutter/material.dart';

import 'package:agenda_web/SRC/Pages/Home.dart';
import 'package:agenda_web/SRC/Routes/Routes.dart';

class PrincipalWindows extends StatelessWidget {
  const PrincipalWindows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: Home.route,
      // routes: getRoutes(),
      // onGenerateRoute: (settings){
      //   return MaterialPageRoute(
      //     builder: error404()
      //   );
      // },
      home: Home()
    );
  }
}