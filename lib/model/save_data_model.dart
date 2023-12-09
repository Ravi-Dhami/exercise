// To parse this JSON data, do
//
//     final saveDataModel = saveDataModelFromJson(jsonString);

import 'dart:convert';

SaveDataModel saveDataModelFromJson(String str) => SaveDataModel.fromJson(json.decode(str));

String saveDataModelToJson(SaveDataModel data) => json.encode(data.toJson());

class SaveDataModel {
  final String? statusCode;
  final String? message;
  final dynamic data;

  SaveDataModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory SaveDataModel.fromJson(Map<String, dynamic> json) => SaveDataModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": data,
  };
}
