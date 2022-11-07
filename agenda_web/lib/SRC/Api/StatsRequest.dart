// ignore_for_file: file_names

import 'package:agenda_web/SRC/Models/StatsModel.dart';
import 'package:http/http.dart' as http;

class StatsRequest {
  
  Future<StatsModel> request() async {
    try{
      var url = Uri.parse("http://127.0.0.1:8090/stats");
      // var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/stats");
      var response = await http.post(url);
      if (response.statusCode == 200) {
        // print(response.body);
        return statsFromJson(response.body);
      }
    }catch(e){
      return StatsModel (noStudens: "...", noDownloads: "...", noCalifications: "...", calification: "...");
    }
    throw Exception();
    

  }
  
}
