// ignore_for_file: file_names

import 'dart:convert';

List<DownloadModel> downloadFromJson(String str) => List<DownloadModel>.from(json.decode(str).map((x) => DownloadModel.fromJson(x)));

class DownloadModel {
  DownloadModel(
    {
      required this.id,
      required this.operativeSystem,
      required this.noDownloads,
      this.url,
      required this.status,
    }
  );

  final int id;
  final String operativeSystem;
  final int noDownloads;
  final String? url;
  final String status;

  factory DownloadModel.fromJson(Map<String, dynamic> json) => DownloadModel(
      id: json["id"],
      operativeSystem: json["operativeSystem"],
      noDownloads: json["noDownloads"],
      url: json["url"],
      status: json["status"],
  );

  @override
  String toString() {
    return super.toString();
  }
}
