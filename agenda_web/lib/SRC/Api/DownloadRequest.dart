// ignore_for_file: file_names

import 'dart:convert';

import 'package:agenda_web/SRC/Models/Download.dart';

import 'package:http/http.dart' as http;

class DownloadRequest {
  List<Download> _downloads = List.empty(growable: true);

  DownloadRequest() {
    request();
  }

  void request() async {
    // print("DownloadRequest");
    var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/download/view");
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
      _downloads = downloadFromJson(response.body);
    }

  }

  List<Download> get download{
    while(_downloads.isEmpty){}
    return _downloads;
  }

  void addCounterDownload(index) async{
    var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/download/addCounter");
    Map<String, String> header = {
      "Accept": "application/json",
      "content-type": "application/json"
    };
    Map<String, int> body = {
      "id": index
    };
    await http.post( url, body: jsonEncode(body), headers: header );
  }
  
}
