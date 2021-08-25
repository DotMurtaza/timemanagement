import 'package:flutter/material.dart';
import 'package:timemanagment/Models/LogSheetModel.dart';
class LogCardView extends StatelessWidget {
   LogCardView({Key key, this.logSheetModel}) : super(key: key);
  final LogSheetModel logSheetModel;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: size.height/5,
        width: size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(children: [
            Text('Start time:${logSheetModel.startTime}'),
            Text('Start time:${logSheetModel.endTime}')

          ],),
        ),
      ),
    );
  }
}
