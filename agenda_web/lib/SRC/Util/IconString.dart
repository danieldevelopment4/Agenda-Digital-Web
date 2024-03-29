// ignore_for_file: file_names

import 'package:agenda_web/SRC/Util/CustomeIcons.dart';
import 'package:flutter/material.dart';

Map<String, IconData> _icon = <String, IconData>{

  "Macintosh": Icons.apple,
  "IPhone": Icons.apple,
  "Windows": CustomeIcons.windows,
  "Linux": CustomeIcons.linux,
  "Android": CustomeIcons.android,
  "...": Icons.error,
};


IconData getIcon(String iconString){

  return _icon[iconString]!;

}