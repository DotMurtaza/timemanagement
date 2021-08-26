import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Views/DetailCardScreen/detail_card_screen.dart';
import 'package:timemanagment/Views/DetailInTable/tabel_main_screen.dart';
import 'package:timemanagment/Views/MainLogSheet/HomeScreen.dart';

class SelectSheetToView extends StatelessWidget {
  const SelectSheetToView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ))),
                  onPressed: () {
                    Get.to(DetailCardScreen());
                  },
                  child: Text('View Data in card')),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ))),
                  onPressed: () {
                    Get.to(TableMianScreen());
                  },
                  child: Text('View Data in sheet')),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ))),
                  onPressed: () {
                    Get.offAll(HomeScreen());
                  },
                  child: Text('Add a new Saponification Sheet')),
            ),
          ],
        ),
      ),
    );
  }
}
