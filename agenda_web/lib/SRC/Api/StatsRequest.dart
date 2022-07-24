// ignore_for_file: file_names

import 'package:agenda_web/SRC/Models/Stats.dart';
import 'package:http/http.dart' as http;

class StatsRequest {
  
  Future<Stats> request() async {
    print("StatsRequest");
    try{
      // var url = Uri.parse("http://127.0.0.1:8080/stats");
      var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/stats");
      var response = await http.post(url);
      if (response.statusCode == 200) {
        // print(response.body);
        return statsFromJson(response.body);
      }
    }catch(e){}
    
    return Stats (noStudens: "...", noDownloads: "...", noCalifications: "...", calification: "...");

  }
  
}
