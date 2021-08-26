import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Models/commonModel.dart';
import 'package:timemanagment/Views/CategoryScreen/categoryScreen.dart';
import '../HomeScreenController/HomeScreenController.dart';

class CommonController extends GetxController {
  final firebaseFirestore = FirebaseFirestore.instance;
  final homeController = Get.put(HomeScreenController());
  RxString docId;
  Rx<List<CommonModel>> commonList = Rx<List<CommonModel>>();

  List<CommonModel> get com => commonList.value;
  @override
  void onInit() {
    commonList.bindStream(logSheetStream());
  }
  Stream<List<CommonModel>> logSheetStream() {
    print("enter in add function");
    return firebaseFirestore
        .collection('logSheetInfo')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<CommonModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(CommonModel.fromDocumentSnapShot(element));
      });

      print('lenght is ${retVal.length}');
      return retVal;
    });
  }

  Future<void> addData(
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
        'date': DateTime.now(),
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
        'sentAtSoap': '',
        'startTimeSoap': '',
        'endTimeSoap': '',
        'stdTimeSoap': '',
        'actTimeSoap': 0,
        'downTimeLossSoap': '',
        'sentAtCir': '',
        'startTimeCir': '',
        'endTimeCir': '',
        'stdTimeCir': '',
        'actTimeCir': 0,
        'downTimeLossCir': ''
      }).then((value) {
        firebaseFirestore.collection('logSheetInfo').doc(value.id);
        docId = value.id.obs;
        clearField();
        Get.to(CatergoryScreen());
        clearField();

        print(value.id);
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  void clearField(){
    homeController.dateController.clear();
    homeController.baseController.clear();
    homeController.boilNoController.clear();
    homeController.panlController.clear();
    homeController.fatController.clear();
    homeController.startTimeController.clear();
    homeController.endTimeController.clear();
    homeController.operatorController.clear();
    homeController.sampleController.clear();
  }

  void onContinue({formKey}) {
    final isValid = formKey.currentState.validate();
    if (isValid) {
      addData(
          homeController.dateController.text,
          homeController.dropDownValue.value,
          homeController.baseController.text,
          homeController.boilNoController.text,
          homeController.panlController.text,
          homeController.fatController.text,
          homeController.startTimeController.text,
          homeController.endTimeController.text,
          homeController.operatorController.text,
          homeController.sampleController.text);
      print('Date is : $homeController._selectedDate');

    } else {
      return;
    }
    formKey.currentState.save;
  }
  Future<void> updateSponification(
      String startTime, String endTime, String stdTime, int actTime,String downTimeLoss) async {
    try {
      firebaseFirestore
          .collection('logSheetInfo')
          .doc(docId.value)
          .update({
        'sentAtSoap': Timestamp.now(),
        'startTimeSoap': startTime,
        'endTimeSoap':endTime,
        'stdTimeSoap':stdTime,
        'actTimeSoap':actTime,
        'downTimeLossSoap':downTimeLoss

          }).then((value) =>
          Get.snackbar('Success', 'Information Saved!'));
    } catch (e) {
      print(e);
      Get.snackbar('Erorr', e.message.toString());
    }
  }

  Future<void> updateCirculation(
      String startTime, String endTime, String stdTime, int actTime,String downTimeLoss) async {
    try {
      firebaseFirestore
          .collection('logSheetInfo')
          .doc(docId.value)
          .update({
        'sentAtCir': Timestamp.now(),
        'startTimeCir': startTime,
        'endTimeCir':endTime,
        'stdTimeCir':stdTime,
        'actTimeCir':actTime,
        'downTimeLossCir':downTimeLoss

      }).then((value) => Get.snackbar('Success', 'Information Saved!'));
    } catch (e) {
      print(e);
      Get.snackbar('Erorr', e.message.toString());
    }
  }
}
