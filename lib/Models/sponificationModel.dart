import 'package:cloud_firestore/cloud_firestore.dart';

class SponificationModel {
  String id;
  String startTime;
  String endTime;
  String stdTime;
  String actTime;
  String downTimeloss;
  Timestamp sentAt;

  SponificationModel(
      {
        this.id,
      this.endTime,
      this.startTime,
      this.stdTime,
      this.actTime,
      this.downTimeloss,
        this.sentAt


      });

  SponificationModel.fromDocumentSnapShot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    print('Model id : ${snapshot.id}');
    endTime = snapshot.data()['endTime'] ?? "";
    startTime = snapshot.data()['startTime'] ?? "";
    stdTime = snapshot.data()['stdTime'] ?? "";
    actTime = snapshot.data()['actTime'] ?? "";
    downTimeloss = snapshot.data()['downTimeLoss'] ?? "";
    sentAt = snapshot.data()['sentAt'] ?? "";
  }
}
