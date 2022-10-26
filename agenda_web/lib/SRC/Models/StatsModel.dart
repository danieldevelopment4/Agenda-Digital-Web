// ignore_for_file: file_names

import 'dart:convert';

StatsModel statsFromJson(String str) => StatsModel.fromJson(json.decode(str));

class StatsModel {
    StatsModel(
      {
        required this.noStudens,
        required this.noDownloads,
        required this.noCalifications,
        required this.calification,
      }
    );

    final String noStudens;
    final String noDownloads;
    final String noCalifications;
    final String calification;

    factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
      noStudens: json["noStudens"],
      noDownloads: json["noDownloads"],
      noCalifications: json["noCalifications"],
      calification: json["calification"],
    );

    Map<String, dynamic> toJson() => {
      "noStudens": noStudens,
      "noDownloads": noDownloads,
      "noCalifications": noCalifications,
      "calification": calification,
    };

}
