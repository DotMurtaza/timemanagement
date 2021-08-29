import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/Models/LogSheetModel.dart';
import 'package:timemanagment/constans/Colors.dart';

import '../user_controller.dart';

class HomeScreenController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController baseController = TextEditingController();
  TextEditingController boilNoController = TextEditingController();
  TextEditingController panlController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController sampleController = TextEditingController();
  DateTime _selectedDate;
  RxString dropDownValue = ''.obs;

  // Rx<LogSheetModel> logSheet = LogSheetModel().obs;
  final firebaseFirestore = FirebaseFirestore.instance;
  //DateTime dateTime;

  // void assign() {
  //   dateController.text = _selectedDate.toString();
  //   print('dateTime');
  // }

  //
  Rx<List<LogSheetModel>> logsheetList = Rx<List<LogSheetModel>>();

  List<LogSheetModel> get log => logsheetList.value;

  @override
  void onInit() {
    logsheetList.bindStream(logSheetStream());
  }

  Stream<List<LogSheetModel>> logSheetStream() {
    print("enter in add function");
    return firebaseFirestore
        .collection('logSheetInfo')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<LogSheetModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(LogSheetModel.fromDocumentSnapShot(element));
      });

      print('lenght is ${retVal.length}');
      return retVal;
    });
  }

  Future<void> addLogData(
    String date,
    String shift,
    String base,
    String boilNo,
    String panlNo,
    String fatChange,
    String startTime,
    String endTime,
    String operator,
    String sampleNo,
  ) async {
    try {
      await firebaseFirestore.collection('logSheetInfo').add({
        'date': date,
        'sentAt': Timestamp.now(),
        'shift': shift,
        'base': base,
        'boilNo': boilNo,
        'panlNo': panlNo,
        'fatChange': fatChange,
        'startTime': startTime,
        'endTime': endTime,
        'operator': operator,
        'sampleNo': sampleNo,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  String validateDate(String value) {
    if (value.length == 0) {
      return "Date can't be Empty";
    } else {
      return null;
    }
  }

  String validateShift(String value) {
    if (value == null) {
      return "Please select any shift";
    } else {
      return null;
    }
  }

  String validateBase(String value) {
    if (value.length == 0) {
      return "Base can't be Empty";
    } else {
      return null;
    }
  }

  String validateBiloNo(String value) {
    if (value.length == 0) {
      return "Please Enter Boil number";
    } else {
      return null;
    }
  }

  String validatePanlNo(String value) {
    if (value.length == 0) {
      return "Please Enter panl number";
    } else {
      return null;
    }
  }

  String validateFatChange(String value) {
    if (value.length == 0) {
      return "This field can't be empty";
    } else {
      return null;
    }
  }

  String validateStartTime(String value) {
    if (value.length == 0) {
      return "Please select Starting Time";
    } else {
      return null;
    }
  }

  String validateEndingTime(String value) {
    if (value.length == 0) {
      return "Please select Ending Time";
    } else {
      return null;
    }
  }

  String validateOperator(String value) {
    if (value.length == 0) {
      return "Operator name is required";
    } else {
      return null;
    }
  }

  String validateSampleNo(String value) {
    if (value.length == 0) {
      return "SampleNo name is required";
    } else {
      return null;
    }
  }

  clearController() {
    dateController.clear();
    // dropDownValue.value=;
    baseController.clear();
    boilNoController.clear();
    panlController.clear();
    fatController.clear();
    startTimeController.clear();
    endTimeController.clear();
    sampleController.clear();
    operatorController.clear();
  }

  void onContinue({formKey}) {
    final isValid = formKey.currentState.validate();
    if (isValid) {
     // assign();
      addLogData(
          dateController.text,
          dropDownValue.value,
          baseController.text,
          boilNoController.text,
          panlController.text,
          fatController.text,
          startTimeController.text,
          endTimeController.text,
          operatorController.text,
          sampleController.text);
      print('Date is : $_selectedDate');

      //clearController();

    } else {
      return;
      //login(emailSignIn.text, passwordSignIn.text);
    }
    formKey.currentState.save;
  }

  selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.black,
                onPrimary: Colors.blueAccent,
                surface: CustomColors.myBlue,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dateController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  startTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      startTimeController.text = formattedTime;
    } else {
      print("Time is not selected");
    }
  }

  endTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      endTimeController.text = formattedTime;
    } else {
      print("Time is not selected");
    }
  }
}
