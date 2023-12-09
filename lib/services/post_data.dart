import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/save_data_model.dart';

class SaveDataImpl {
  final Dio _dio = Dio();

  Future<SaveDataModel?> saveDataFun({
    String? studentName,
    String? studentAddress,
    String? dob,
    String? admissionDate,
    String? mobileNumber,
    String? certificate,
    String? attchmentExt,
    var subject,
  }) async {
    try {
      var data = {
        "StudentName":"Rahi",
        "StudentAddress":"Bharundi",
        "DOB":"2022-11-01 11:10:00",
        "DateOfAddmition":"2022-11-16 11:10:00",
        "MobileNo":"9409586802",
        "DOBCertificate":"",
        "AttchmentExt":"",
        "subject":
        [
          {
            "SubjectId":"1"
          },
          {
            "SubjectId":"2"
          },
          {
            "SubjectId":"3"
          },
          {
            "SubjectId":"4"
          },
          {
            "SubjectId":"6"
          }
        ]
        /*"StudentName":studentName,
        "StudentAddress":studentAddress,
        "DOB":dob,
        "DateOfAddmition":admissionDate,
        "MobileNo":"9409586802",
        "DOBCertificate":certificate,
        "AttchmentExt":attchmentExt,
        "subject":subject*/
      };
      final Response response = await _dio.post(
        'http://angulartest.ducem.in/api/Candidate/SaveStudentDetails',
        data: jsonEncode(data),
      );
      print(response.data);
      return SaveDataModel.fromJson(response.data);
    } catch (e) {
      print("${e}");
    }
    return null;
  }
}
