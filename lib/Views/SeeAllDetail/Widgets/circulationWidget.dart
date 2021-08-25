import 'package:flutter/material.dart';
import 'package:timemanagment/Models/circulationModel.dart';
class CirculationWidget extends StatelessWidget {
  const CirculationWidget({Key key, this.circulationModel}) : super(key: key);
  final CirculationModel circulationModel;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height/4,

      child: Text('Circulation'),
    );
  }
}
