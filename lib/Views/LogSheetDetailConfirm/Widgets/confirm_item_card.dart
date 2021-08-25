import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Models/LogSheetModel.dart';
import 'package:timemanagment/Views/CategoryScreen/categoryScreen.dart';
import 'package:timemanagment/constans/Colors.dart';

class ConfirmItemWidget extends StatelessWidget {
  ConfirmItemWidget({Key key, this.logSheetModel}) : super(key: key);
  final LogSheetModel logSheetModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String checkDate = logSheetModel.date;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: size.height / 5,
          width: size.width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: checkDate == DateTime.now()
                          ? CustomColors.myBlue
                          : CustomColors.myBlue.withOpacity(0.5)),
                  child: Center(
                      child: Text(
                    'Date : ${logSheetModel.date}',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text('Date : ${logSheetModel.date}'),
                    // VertDivider(),
                    Text('Shift : ${logSheetModel.shift}'),
                    VertDivider(),
                    Text('Base : ${logSheetModel.base}'),
                    VertDivider(),
                    Text('BoilNo : ${logSheetModel.boilNo}'),
                    VertDivider(),
                    Text('panlNo : ${logSheetModel.panlNo}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Fat change : ${logSheetModel.fatChange}'),

                    VertDivider(),
                    Text('Start Time : ${logSheetModel.startTime}'),
                    VertDivider(),
                    Text('End Time : ${logSheetModel.endTime}'),
                  ],
                ),
               // VertDivider(),
                Text('Operator : ${logSheetModel.operator}'),
              ],
            ),
          ),
        ),
      ),
      onTap:(){ Get.to(CatergoryScreen(id: logSheetModel.id,));},
    );
  }

  Widget VertDivider() {
    return SizedBox(
        height: 20,
        child: VerticalDivider(
          color: Colors.black,
          width: 2.0,
          thickness: 2.0,
        ));
  }
}
