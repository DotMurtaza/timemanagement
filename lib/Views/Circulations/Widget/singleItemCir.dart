import 'package:flutter/material.dart';
import 'package:timemanagment/Models/circulationModel.dart';

import '../../../constans/Colors.dart';

class CirculationWidget extends StatelessWidget {
  const CirculationWidget({Key key, this.circulationModel}) : super(key: key);
  final CirculationModel circulationModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5.0,
      child: Container(
        height: size.height / 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 25,
                    color: CustomColors.myBlue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Start Time : ${circulationModel.startTime}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.timer,
                    size: 25,
                    color: CustomColors.myBlue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'End Time : ${circulationModel.endTime}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Text(
                'Time diffrence : ${circulationModel.actTime}',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                'DownTime Losses',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Container(
                height: 70,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${circulationModel.downTimeloss}',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
