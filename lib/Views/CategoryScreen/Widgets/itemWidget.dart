import 'package:flutter/material.dart';
class ImtemWidget extends StatelessWidget {
  ImtemWidget({
    Key key,
    this.image,
    this.text,
    //this.press,
  }) : super(key: key);
  final String image;
  final String text;
  //final Function press;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Center(
        child: Container(
          height: size.height/3.2,
          width: size.width/2.3,
          child: Column(
            children: [
              Container(
                height: size.height/5,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 70,
                child: Center(
                  child: Text(text),
                ),
              )
            ],
          ),
        ));
  }
}