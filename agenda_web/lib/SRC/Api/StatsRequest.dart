// ignore_for_file: file_names

import 'dart:convert';

import 'package:agenda_web/SRC/Models/Stats.dart';
import 'package:http/http.dart' as http;

class StatsRequest {
  
  Stats? _stats;

  StatsRequest(){
    request();
  }

  void request() async {
    // print("StatsRequest");
    var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/stats");
    Map<String, String> header = {
      "Accept": "application/json",
      "content-type": "application/json"
    };
    var response = await http.post(
      url, 
      headers: header
    );
    if (response.statusCode == 200) {
      // print(response.body);
      _stats = statsFromJson(response.body);
    }else{
      _stats =Stats (noStudens: "...", noDownloads: "...", noCalifications: "...", calification: "...");
    }

  }

  Stats get stats{
    while(_stats==null){}
    return _stats!;
  }
   
}
