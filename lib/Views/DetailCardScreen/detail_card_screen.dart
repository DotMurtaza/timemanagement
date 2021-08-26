import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CommonController/common_controller.dart';

import '../../constans/Colors.dart';
import 'Widget/singleItem.dart';

class DetailCardScreen extends StatelessWidget {
  DetailCardScreen({Key key}) : super(key: key);
  final commonController = Get.put(CommonController());

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
        elevation: 3,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Detail',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetX<CommonController>(
            init: Get.put<CommonController>(CommonController()),
            builder: (CommonController commonController) {
              if (commonController != null && commonController.com != null) {
                return Container(
                  height: size.height / 1.2,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: commonController.com.length,
                      itemBuilder: (context, index) {
                        return SingleCard(
                          commonModel: commonController.com[index],
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
      ),
    );
  }
}
