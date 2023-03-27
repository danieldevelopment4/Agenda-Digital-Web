import 'package:agenda_web/SRC/App.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'SRC/Logic/Provider.dart';

void main() async {
  // https://www.science.co.il/language/Codes.php  Codigos de lenguajes
  LocalizationDelegate delegate = await LocalizationDelegate.create(
    basePath: 'i18n',
    fallbackLocale: 'en',//lenguaje con el que el aplicativo inicia
    supportedLocales: ['en', 'es', 'fr', 'pt', 'de', 'zh', 'ja', 'ru']
  );

  runApp(Provider(child: LocalizedApp(delegate, const App())));
}