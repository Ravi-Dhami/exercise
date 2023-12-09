// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

SubjectModel subjectModelFromJson(String str) => SubjectModel.fromJson(json.decode(str));

String subjectModelToJson(SubjectModel data) => json.encode(data.toJson());

class SubjectModel {
  final List<Table>? table;

  SubjectModel({
    this.table,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    table: json["Table"] == null ? [] : List<Table>.from(json["Table"]!.map((x) => Table.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Table": table == null ? [] : List<dynamic>.from(table!.map((x) => x.toJson())),
  };
}

class Table {
  final int? subId;
  final String? subName;

  Table({
    this.subId,
    this.subName,
  });

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    subId: json["Sub_Id"],
    subName: json["Sub_Name"],
  );

  Map<String, dynamic> toJson() => {
    "Sub_Id": subId,
    "Sub_Name": subName,
  };
}
