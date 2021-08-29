import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/Models/commonModel.dart';
import 'package:timemanagment/constans/Colors.dart';

class SingleCard extends StatelessWidget {
  SingleCard({Key key, this.commonModel}) : super(key: key);
  final CommonModel commonModel;

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.fromMicrosecondsSinceEpoch(
        commonModel.date.microsecondsSinceEpoch);
    var formatedDate = DateFormat.yMMMd().format(dt);
    print('date is${DateFormat.yMMMd().format(dt)}');

    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.myBlue.withOpacity(0.7)),
                child: Center(
                    child: Text(
                  'Date : $formatedDate',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
              _singleitem('Shift', commonModel.shift),
              SizedBox(
                height: 10,
              ),
              _singleitem('Pan', commonModel.panlNo),
              SizedBox(
                height: 10,
              ),
              _singleitem('Boiler', commonModel.boilNo),
              SizedBox(
                height: 10,
              ),
              _singleitem('Base', commonModel.base),
              SizedBox(
                height: 10,
              ),

              _singleitem('Sample', commonModel.sampleNo),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'SapTime Diff',
                      style: TextStyle(color: CustomColors.myBlue, fontSize: 19),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Text(
                      '${commonModel.actTimeSoap!=0?180-commonModel.actTimeSoap:commonModel.actTimeCir}',
                      style: TextStyle(color: CustomColors.myBlue, fontSize: 19),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                     Text(
                       'CirTime Diff',
                       style: TextStyle(color: CustomColors.myBlue, fontSize: 19),
                     ),
                   ],),
                   SizedBox(width: 120,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${commonModel.actTimeCir!=0?90-commonModel.actTimeCir:commonModel.actTimeCir}',
                          style: TextStyle(color: CustomColors.myBlue, fontSize: 19),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CustomColors.myBlue.withOpacity(0.7)),
                child: Center(
                    child: Text(
                      'Operator : ${commonModel.operator}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _singleitem(String name, dynamic data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               name,
               style: TextStyle(color: CustomColors.myBlue, fontSize: 19),
             ),
             SizedBox(
               width: 200,
             ),

           ],
         ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data,
                style: TextStyle(color: CustomColors.myBlue, fontSize: 19),
              ),
            ],
          )
        ],
      ),
    );
  }
}
