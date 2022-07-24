// ignore_for_file: file_names

import 'package:agenda_web/SRC/Api/DownloadRequest.dart';
import 'package:agenda_web/SRC/Api/StatsRequest.dart';
import 'package:agenda_web/SRC/Models/Download.dart';
import 'package:agenda_web/SRC/Models/Stats.dart';

class Management {

  late StatsRequest _statsRequest;
  late DownloadRequest _downloadRequest;

  Management(){
    _statsRequest = StatsRequest();
    _downloadRequest = DownloadRequest();
  }

  //Stats
  Future<Stats> statsRequest() {
    return _statsRequest.request();
  }

  //Downloads
  Future<List<Download>> downloadRequest() {
    return _downloadRequest.request();
  }

  void addCounterDownload(index){
    _downloadRequest.addCounterDownload(index);
  }

}
