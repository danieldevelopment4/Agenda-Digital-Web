// ignore_for_file: file_names

import 'dart:convert';

Stats statsFromJson(String str) => Stats.fromJson(json.decode(str));

String statsToJson(Stats data) => json.encode(data.toJson());

class Stats {
    Stats(
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

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
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
