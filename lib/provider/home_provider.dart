import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../custom_widgets/toast.dart';
import '../model/save_data_model.dart';
import '../model/subject_model.dart';
import '../services/get_subject.dart';
import '../services/post_data.dart';

class HomeController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? dob;
  DateTime? admissionDate;
  String d = 'Select Date of Birth';
  String a = 'Select Admission Date';
  TextEditingController studentNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController admissionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? fileName = 'Select File';
  String? base64Img = '';
  SubjectModel? subjectModel;
  SaveDataModel? saveDataModel;
  List<String> tempList = [];
  List<Map<String, dynamic>> temp = [];
  dateTimePickerWidget(BuildContext context, Function date) {
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'dd MMMM yyyy HH:mm',
      initialDateTime: DateTime.now(),
      minDateTime: DateTime(1950),
      maxDateTime: DateTime(2050),
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (dateTime, List<int> index) {
        DateTime selectdate = dateTime;
        date(selectdate);
      },
    );
  }

  dobPick(context) {
    dateTimePickerWidget(context, (value) {
      if (admissionDate == null) {
        dob = value;
        d = DateFormat('dd-MMM-yyyy - HH:mm').format(dob!);
        dobController.text = d.toString();
        notifyListeners();
      } else if (admissionDate!.isAfter(value)) {
        dob = value;
        d = DateFormat('dd-MMM-yyyy - HH:mm').format(dob!);
        dobController.text = d.toString();
        notifyListeners();
      }
    });
  }

  admissionPick(context) {
    dateTimePickerWidget(context, (value) {
      if (dob == null) {
        admissionDate = value;
        a = DateFormat('dd-MMM-yyyy - HH:mm').format(admissionDate!);
        admissionController.text = a.toString();

        notifyListeners();
      } else if (dob!.isBefore(value)) {
        admissionDate = value;
        a = DateFormat('dd-MMM-yyyy - HH:mm').format(admissionDate!);
        admissionController.text = a.toString();

        notifyListeners();
      }
    });
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf'],
    );

    if (result != null && result.files.single.path != null) {
      PlatformFile? file = result.files.first;
      print("----${file.name}");
      fileName = file.name;
      File? files = File(file.path.toString());
      print('File is = ' + files.toString());
      List<int> fileInByte = files.readAsBytesSync();
      String fileInBase64 = base64Encode(fileInByte);
      base64Img = fileInBase64;
      print('00000${fileInBase64}');
      notifyListeners();
    }
    notifyListeners();
  }

  subjectList() async {
    subjectModel = (await SubjectImpl().getSubjectFun());
    notifyListeners();
  }

  saveData(context) async {
    saveDataModel = await SaveDataImpl().saveDataFun(
      studentName:studentNameController.text.toUpperCase(),
      mobileNumber:mobileNumberController.text,
      dob:dobController.text,
      admissionDate:admissionController.text,
      certificate:base64Img.toString(),
      studentAddress:addressController.text.toUpperCase(),
      attchmentExt:"",
    );
    if (saveDataModel!.statusCode == "1") {
      toast(saveDataModel!.message);
      clear();
    } else {
      toast(saveDataModel!.message);

    }
  }
  clear(){
    studentNameController.clear();
    mobileNumberController.clear();
    dobController.clear();
    admissionController.clear();
    fileName = '';
    addressController.clear();
    temp = [];
    tempList = [];
    notifyListeners();
  }
}
