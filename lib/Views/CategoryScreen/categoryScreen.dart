import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Views/Analysis/analysis_screen.dart';
import 'package:timemanagment/Views/CategoryScreen/Widgets/itemWidget.dart';
import 'package:timemanagment/Views/Circulations/circulation_screen.dart';
import 'package:timemanagment/Views/SelectSheetToView/slect_sheet_to_view.dart';
import 'package:timemanagment/Views/Soponification/soponification.dart';
import 'package:timemanagment/constans/Colors.dart';

import '../../constans/Colors.dart';
import '../../constans/Colors.dart';

class CatergoryScreen extends StatelessWidget {
  CatergoryScreen({Key key, this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> images = [
      'assets/images/soap.jpeg',
      'assets/images/circulation.jpeg',
      'assets/images/ingrdient.jpeg',
      'assets/images/analysis.jpeg',
    ];
    List<String> text = [
      'Soponification',
      'Circulation',
      'Quantity of ingredient',
      'Analysis',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: CustomColors.white),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: CustomColors.myBlue,
                ),
                onPressed: () {
                  Get.back();
                },
              )),
        ),
        backgroundColor: CustomColors.white,
        elevation: 3,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Soap Making Department',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                height: size.height / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Card(
                            elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ImtemWidget(
                                text: 'Saponification',
                                image: 'assets/images/soap.jpeg',
                              )),
                          onTap: () {
                            Get.to(Soponification(
                              id: id,
                            ));
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ImtemWidget(
                                text: 'Circulation',
                                image: 'assets/images/circulation.jpeg',
                              )),
                          onTap: () {
                            Get.to(CirculationScreen(
                              id: id,
                            ));
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Card(
                            elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ImtemWidget(
                                text: 'Quantity of ingredient',
                                image: 'assets/images/ingrdient.jpeg',
                              )),
                          onTap: () {
                            Get.defaultDialog(
                                title: 'Quantity of ingredient',
                                middleText: 'This field yet to be add soon! ',
                                textConfirm: 'Okay',
                                onConfirm: (){Get.back();},
                                confirmTextColor: Colors.amberAccent,
                                textCancel: 'Cancel');
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: ImtemWidget(
                                text: 'Analysis',
                                image: 'assets/images/analysis.jpeg',
                              )),
                          onTap: () {
                            Get.defaultDialog(
                                title: 'Analysis',
                                middleText: 'This field yet to be add soon! ',
                                textConfirm: 'Okay',
                                onConfirm: (){Get.back();},
                                confirmTextColor: Colors.amberAccent,
                                textCancel: 'Cancel');
                          },
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          SizedBox(height: 23,),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [BoxShadow(offset: Offset(0,5),blurRadius: 7,spreadRadius: 5,color: Colors.white.withOpacity(0.4))]
              ),
              child: FlatButton(minWidth: 190,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: CustomColors.myBlue,width: 1)),
                color: Colors.transparent,
                splashColor: Colors.black26,
                onPressed: () {
                 Get.to(SelectSheetToView());
                },
                child: Text(
                  'Check Detail!',
                  style: TextStyle(color: CustomColors.myBlue,fontSize: 19),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
