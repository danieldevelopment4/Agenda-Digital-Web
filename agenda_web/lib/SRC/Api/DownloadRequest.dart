// ignore_for_file: file_names

import 'package:agenda_web/SRC/Models/Download.dart';

import 'package:http/http.dart' as http;

class DownloadRequest {

  Future<List<Download>> request() async {
    print("DownloadRequest");
    try{
      // var url = Uri.parse("http://127.0.0.1:8080/download/view");
      var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/download/view");
      var response = await http.post( url);
      if (response.statusCode == 200) {
        // print(response.body);
        return downloadFromJson(response.body);
      }
    }catch(e){}
    Download download = Download(id: -1, operativeSystem: "...", noDownloads: -1, url: null, status: "...");
    List<Download> list = List.empty(growable: true);
    list.add(download);
    list.add(download);
    list.add(download);
    list.add(download);
    list.add(download);
    return list;
    
  }

  void addCounterDownload(index) async{
    // var url = Uri.parse("http://127.0.0.1:8080/download/addCounter?id="+index.toString());
    var url = Uri.parse("https://back-end-agenda-digital.herokuapp.com/download/addCounter?id="+index.toString());
    await http.post( url);
  }
  
}
