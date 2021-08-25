import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/Models/sponificationModel.dart';

class SponifactionController extends GetxController {
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController downTimeController = TextEditingController();
  DateTime startingDate = DateTime.now();
  DateTime endingDate = DateTime.now();
  final firebaseFirestore = FirebaseFirestore.instance;
  Rx<List<SponificationModel>> sponificationList =
      Rx<List<SponificationModel>>();

  List<SponificationModel> get sope => sponificationList.value;

  DateTime formattedTime;

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
      formattedTime = parsedTime;
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      startingDate = formattedTime;

      startTimeController.text = DateFormat('kk:mm:a').format(formattedTime);

      //  startingDate=formattedTime;
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
      formattedTime = parsedTime;
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      endingDate = formattedTime;
      endTimeController.text = DateFormat('kk:mm:a').format(formattedTime);

      // endingDate=formattedTime as DateTime;
    } else {
      print("Time is not selected");
    }
  }

  Future<void> sponificationData(
      // String id,

      String startTime,
      String endTime,
      String standardTime,
      String actualTime,
      String uid,
      String downTimeLosses) async {
    try {
      await firebaseFirestore
          .collection('logSheetInfo')
          .doc(uid)
          .collection('sponification')
          .add({
        // 'id': id,
        'sentAt': Timestamp.now(),
        'startTime': startTime,
        'endTime': endTime,
        'stdTime': standardTime,
        'actTime': actualTime,
        'downTimeLoss': downTimeLosses
      }).then((value) => Get.snackbar('Success', 'Information saved !'));
    } catch (e) {
      print(e);
      Get.snackbar('Erorr', e.toString());
      rethrow;
    }
  }


  void getSopeSteam( String uid) {

    sponificationList.bindStream(sopeStream(uid));
  }

  Stream<List<SponificationModel>> sopeStream(String uid) {
    print("enter in add function");
    return firebaseFirestore
        .collection('logSheetInfo')
        .doc(uid)
        .collection('sponification')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<SponificationModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(SponificationModel.fromDocumentSnapShot(element));
      });

      print('lenght is ${retVal.length}');
      return retVal;
    });
  }
}
