// ignore_for_file: file_names

import 'package:agenda_web/SRC/Logic/Provider.dart';
import 'package:agenda_web/SRC/Pages/PrincipalWindow.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PrincipalWindow(),
      ),
    );
  }
}