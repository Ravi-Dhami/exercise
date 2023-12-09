import 'package:exercise/custom_widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_widgets/textfield.dart';
import '../custom_widgets/validation.dart';
import '../provider/home_provider.dart';
import '../utils/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<HomeController>(context, listen: false).subjectList();
    }); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Student Details'),
          centerTitle: true,
        ),
        body: Form(
          key: homeController.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameField(
                  controller: homeController.studentNameController,
                  hintTxt: 'Student Name',
                  validator: (val) => FieldValidator.validateName(
                      val.toString().trim(), context),
                  keyboardType: TextInputType.name,
                ),
                NameField(
                  controller: homeController.mobileNumberController,
                  hintTxt: 'Mobile Number',
                  validator: (val) => FieldValidator.validateNumber(
                      val.toString().trim(), context),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                ),
                NameField(
                  controller: homeController.dobController,
                  hintTxt: 'Pick Date-Time Dob',
                  onTap: () {
                    homeController.dobPick(context);
                  },
                  validator: (val) => FieldValidator.validateDob(
                      val.toString().trim(), context),
                ),
                NameField(
                  controller: homeController.admissionController,
                  hintTxt: 'Pick Date-Time Admission',
                  onTap: () {
                    homeController.admissionPick(context);
                  },
                  validator: (val) => FieldValidator.validateAdmissionDate(
                      val.toString().trim(), context),
                ),
                NameField(
                  controller: homeController.addressController,
                  hintTxt: 'Student Address',
                  validator: (val) => FieldValidator.validateAddress(
                      val.toString().trim(), context),
                ),
                Text('Birth Certificate Attachment'),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          homeController.pickFile();
                        },
                        child: Text('Choose file')),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(homeController.fileName.toString()),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: ListView.builder(
                        itemCount:
                            homeController.subjectModel?.table!.length ?? 0,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(
                                homeController.subjectModel!.table![i].subName
                                    .toString(),
                                style: TextStyle(color: AppColor.black)),
                            trailing: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (homeController.tempList.contains(
                                      homeController
                                          .subjectModel!.table![i].subName
                                          .toString())) {
                                    homeController.tempList.remove(
                                        homeController
                                            .subjectModel!.table![i].subName
                                            .toString());

                                    homeController.temp.removeWhere((element) =>
                                        element["SubjectId"] ==
                                        homeController
                                            .subjectModel!.table![i].subId
                                            .toString());
                                  } else {
                                    homeController.tempList.add(homeController
                                        .subjectModel!.table![i].subName
                                        .toString());
                                    homeController.temp.add({
                                      "SubjectId":
                                          "${homeController.subjectModel!.table![i].subId}"
                                    });
                                  }
                                });

                                print(homeController.tempList.toString());
                                print(homeController.temp.toString());
                              },
                              child: Text(homeController.tempList.contains(
                                      homeController
                                          .subjectModel!.table![i].subName
                                          .toString())
                                  ? "Remove"
                                  : "Add"),
                            ),
                          );
                        }),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        // homeController.saveData(context);

                        if (homeController.formKey.currentState!.validate()) {
                          if (homeController.base64Img!.isNotEmpty) {
                            if (homeController.temp.length >= 4) {
                              CircularProgressIndicator();
                              homeController.saveData(context);
                            } else {
                              toast("Minimum 4 subjects to be selected");
                            }
                          } else {
                            toast("Attach Birth Certificate");
                          }
                        }
                      },
                      child: Text('\t\t\tSave\t\t\t')),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
