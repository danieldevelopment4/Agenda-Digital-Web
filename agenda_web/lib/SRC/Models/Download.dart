// ignore_for_file: file_names

import 'dart:convert';

List<Download> downloadFromJson(String str) => List<Download>.from(json.decode(str).map((x) => Download.fromJson(x)));

String downloadToJson(List<Download> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Download {
    Download(
      {
        required this.id,
        required this.operativeSystem,
        required this.noDownloads,
        required this.url,
        required this.status,
      }
    );

    final int id;
    final String operativeSystem;
    final int noDownloads;
    final String? url;
    final String status;

    factory Download.fromJson(Map<String, dynamic> json) => Download(
        id: json["id"],
        operativeSystem: json["operativeSystem"],
        noDownloads: json["noDownloads"],
        url: json["url"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "operativeSystem": operativeSystem,
        "noDownloads": noDownloads,
        "url": url,
        "status": status,
    };
}
