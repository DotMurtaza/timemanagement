import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CirculationController/circulation_controller.dart';
import 'package:timemanagment/Controller/SoponificationController/sponification_controller.dart';
import 'package:timemanagment/constans/Colors.dart';

import 'Widgets/circulationWidget.dart';
import 'Widgets/sponificationWidget.dart';

class AllDetail extends StatelessWidget {
  const AllDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        elevation: 10.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Record',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 12),
              child: Card(elevation: 10,),
             // color: Colors.blue,
              height: size.height / 4,
              width: size.width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Align(alignment: Alignment.center,child: Text('Sponification')),
                GetX<SponifactionController>(
                  init: Get.put<SponifactionController>(
                      SponifactionController()),
                  builder: (SponifactionController sopeController) {
                    if (sopeController != null &&
                        sopeController.sope != null) {
                      return Container(
                        color: Colors.yellow,
                        height: size.height / 2,
                        width: size.width / 2,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: sopeController.sope.length,
                            itemBuilder: (context, index) {
                              return SponificationWidget(
                                sopeModel: sopeController.sope[index],
                              );
                            }),
                      );
                    } else {
                      return Text(
                        'Loading...',
                        style: TextStyle(fontSize: 20),
                      );
                    }
                  },
                ),
                //Align(alignment: Alignment.center,child: Text('Circulation')),
                GetX<CirculationController>(
                  init:
                      Get.put<CirculationController>(CirculationController()),
                  builder: (CirculationController cirController) {
                    if (cirController != null &&
                        cirController.circlulation != null) {
                      return Container(
                        color: Colors.pink,
                        height: size.height / 2,
                        width: size.width / 2,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: cirController.circlulation.length,
                            itemBuilder: (context, index) {
                              return CirculationWidget(
                                circulationModel:
                                    cirController.circlulation[index],
                              );
                            }),
                      );
                    } else {
                      return Text(
                        'Loading...',
                        style: TextStyle(fontSize: 20),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
