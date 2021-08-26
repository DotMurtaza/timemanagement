import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/HomeScreenController/HomeScreenController.dart';
import 'package:timemanagment/Models/user_model.dart';

import 'Widgets/log_card_item.dart';
class AnalysisScreen extends StatelessWidget {
   AnalysisScreen({Key key, this.userModel}) : super(key: key);
  final logController = Get.put(HomeScreenController());
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('here is the data'),

            GetX<HomeScreenController>(
              init: Get.put<HomeScreenController>(HomeScreenController()),
              builder: (HomeScreenController homeController){
                if(homeController!=null && homeController.log!=null){
                  return
                    Container(
                      height: 200,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: homeController.log.length,
                          itemBuilder: (context,index){
                            return
                              LogCardView(logSheetModel: homeController.log[index],);
                          }),
                    );
                }
                else{
                  return Text('Loading...',style: TextStyle(fontSize: 20),);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
