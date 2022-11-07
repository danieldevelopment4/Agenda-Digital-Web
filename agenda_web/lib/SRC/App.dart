// ignore_for_file: file_names

import 'package:agenda_web/SRC/Pages/PrincipalWindow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    List<LocalizationsDelegate<dynamic>> delegates = List.empty(growable: true);
    delegates.addAll(GlobalMaterialLocalizations.delegates);
    delegates.add(GlobalWidgetsLocalizations.delegate);
    delegates.add(localizationDelegate);
    
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: delegates,
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        home: const PrincipalWindow(),
      ),
    );
  }
}