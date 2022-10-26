// ignore_for_file: file_names

import 'package:agenda_web/SRC/Api/DownloadRequest.dart';
import 'package:agenda_web/SRC/Api/StatsRequest.dart';
import 'package:agenda_web/SRC/Models/DownloadModel.dart';
import 'package:agenda_web/SRC/Models/StatsModel.dart';

class Management {

  late StatsRequest _statsRequest;
  late DownloadRequest _downloadRequest;

  late StatsModel _stats;
  late List<DownloadModel> _downloads;

  Management(){
    _statsRequest = StatsRequest();
    _downloadRequest = DownloadRequest();
    _loadData();    
  }

  void _loadData() async{
    _stats = await _statsRequest.request();
    _downloads = await _downloadRequest.getDownloadsData();
  }

  //Stats
  StatsModel getStatsData() {
    return _stats;
  }

  //Downloads
  List<DownloadModel> getDownloadData() {
    return _downloads;
  }

  void addCounterDownload(index){
    _downloadRequest.addCounterDownload(index);
  }

}
