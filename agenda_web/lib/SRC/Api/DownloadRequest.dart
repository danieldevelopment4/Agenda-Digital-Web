// ignore_for_file: file_names

import 'dart:convert';

import 'package:agenda_web/SRC/Models/DownloadModel.dart';

import 'package:http/http.dart' as http;

class DownloadRequest {

  Future<List<DownloadModel>> getDownloadsData() async {
    try{
      // var url = Uri.parse("http://127.0.0.1:8090/download/view");
      var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/download/view");
      var response = await http.post( url);
      if (response.statusCode == 200) {
        // print(response.body);
        return downloadFromJson(response.body);
      }
    }catch(e){
      DownloadModel download = DownloadModel(id: -1, operativeSystem: "...", noDownloads: -1, url: null, status: "...");
      List<DownloadModel> list = List.empty(growable: true);
      list.add(download);
      list.add(download);
      list.add(download);
      list.add(download);
      list.add(download);
      return list;
    }
    throw Exception();
    
  }

  void addCounterDownload(index) async{
    try{
      // var url = Uri.parse("http://127.0.0.1:8090/download/addCounter");
      var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/download/addCounter");
      Map<String, String> header = {
        "Accept": "application/json",
        "content-type": "application/json"
      };
      Map<String, int> body = {
        "id": index
      };
      await http.post( url, body: jsonEncode(body), headers: header );
    }catch(e){
      throw Exception();
    }
  }
  
}
