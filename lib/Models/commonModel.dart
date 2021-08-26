import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CommonModel {
  String id;
  Timestamp sentAt;
  Timestamp date;
  String shift;
  String base;
  String boilNo;
  String panlNo;
  String fatChange;
  String startTime;
  String endTime;
  String operator;
  String sampleNo;
  String startTimeSoap;
  String endTimeSoap;
  String stdTimeSoap;
  int actTimeSoap;
  String downTimeLossSoap;
  String startTimeCir;
  String endTimeCir;
  String stdTimeCir;
  int actTimeCir;
  String downTimeLossCir;

  CommonModel(
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
      this.sampleNo,
      this.sentAt,
      this.actTimeSoap,
      this.downTimeLossSoap,
      this.endTimeSoap,
      this.startTimeSoap,
      this.stdTimeSoap,
      this.actTimeCir,
      this.downTimeLossCir,
      this.endTimeCir,
      this.startTimeCir,
      this.stdTimeCir});

  CommonModel.fromDocumentSnapShot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    sentAt = Timestamp.now();

    date = snapshot.data()['date'] ?? "";

    shift = snapshot.data()['shift'] ?? "";
    base = snapshot.data()['base'] ?? "";
    endTime = snapshot.data()['endTime'] ?? "";
    startTime = snapshot.data()['startTime'] ?? "";
    boilNo = snapshot.data()['boilNo'] ?? "";
    fatChange = snapshot.data()['fatChange'] ?? "";
    operator = snapshot.data()['operator'] ?? "";
    panlNo = snapshot.data()['panlNo'] ?? "";
    sampleNo = snapshot.data()['sampleNo'] ?? "";
    startTimeSoap = snapshot.data()['startTimeSoap'] ?? "";
    endTimeSoap = snapshot.data()['endTimeSoap'] ?? "";
    stdTimeSoap = snapshot.data()['stdTimeSoap'] ?? "";
    actTimeSoap = snapshot.data()['actTimeSoap'] ?? "";
    downTimeLossSoap = snapshot.data()['downTimeLossSoap'] ?? "";
    startTimeCir = snapshot.data()['startTimeCir'] ?? "";
    endTimeCir = snapshot.data()['endTimeCir'] ?? "";
    stdTimeCir = snapshot.data()['stdTimeCir'] ?? "";
    actTimeCir = snapshot.data()['actTimeCir'] ?? "";
    downTimeLossCir = snapshot.data()['downTimeLossCir'] ?? "";
  }
}
