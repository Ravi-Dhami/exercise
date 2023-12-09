import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/subject_model.dart';

class SubjectImpl {
  final Dio _dio = Dio();

  Future<SubjectModel?> getSubjectFun() async {
    try {
      final Response response = await _dio
          .post('http://angulartest.ducem.in/api/Candidate/GetSubjectList');
      return SubjectModel.fromJson(jsonDecode(response.data));
    } catch (e) {
      print("${e}");
    }
  }
}
