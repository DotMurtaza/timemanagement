import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/HomeScreenController/HomeScreenController.dart';
import 'package:timemanagment/Views/CategoryScreen/categoryScreen.dart';
import 'package:timemanagment/Views/LogSheetDetailConfirm/Widgets/confirm_item_card.dart';
import 'package:timemanagment/constans/Colors.dart';
class ConfirmLogSheet extends StatelessWidget {
  const ConfirmLogSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('here is the data'),

            GetX<HomeScreenController>(
              init: Get.put<HomeScreenController>(HomeScreenController()),
              builder: (HomeScreenController homeController){
                if(homeController!=null && homeController.log!=null){
                  return
                    Container(
                      height: size.height/1.1,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: homeController.log.length,
                          itemBuilder: (context,index){

                            return
                              ConfirmItemWidget(logSheetModel: homeController.log[index],);
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
        floatingActionButton: FloatingActionButton.extended(backgroundColor: CustomColors.myBlue,
          onPressed: () {
        Get.to(CatergoryScreen());
          },
          label: Text(
            "Continue..",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
