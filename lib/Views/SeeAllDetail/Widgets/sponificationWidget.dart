import 'package:flutter/material.dart';
import 'package:timemanagment/Models/sponificationModel.dart';
class SponificationWidget extends StatelessWidget {
  const SponificationWidget({Key key, this.sopeModel}) : super(key: key);
  final SponificationModel sopeModel;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      height: size.height/4,
      child: Column(children: [
        Text(sopeModel.downTimeloss)
      ],),
    );
  }
}
