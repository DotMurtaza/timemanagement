import 'package:cloud_firestore/cloud_firestore.dart';

class LogSheetModel {
  String id;
  String date;
  String shift;
  String base;
  String boilNo;
  String panlNo;
  String fatChange;
  String startTime;
  String endTime;
  String operator;
  String sampleNo;

  LogSheetModel(
      {this.id,
        this.date,
      this.shift,
      this.base,
      this.endTime,
      this.startTime,
      this.boilNo,
      this.fatChange,
      this.operator,
      this.panlNo,
      this.sampleNo});
  LogSheetModel.fromDocumentSnapShot(DocumentSnapshot snapshot){
    id=snapshot.id;
    print('Model id : ${snapshot.id}');
    date=snapshot.data()['date']??"";
    shift=snapshot.data()['shift']??"";
    base=snapshot.data()['base']??"";
    endTime=snapshot.data()['endTime']??"";
    startTime=snapshot.data()['startTime']??"";
    boilNo=snapshot.data()['boilNo']??"";
    fatChange=snapshot.data()['fatChange']??"";
    operator=snapshot.data()['operator']??"";
    panlNo=snapshot.data()['panlNo']??"";
    sampleNo=snapshot.data()['sampleNo']??"";


  }

}
