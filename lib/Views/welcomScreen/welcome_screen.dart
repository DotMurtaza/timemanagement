import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Views/DetailInTable/tabel_main_screen.dart';
import 'package:timemanagment/Views/MainLogSheet/HomeScreen.dart';
import 'package:timemanagment/Views/SelectSheetToView/slect_sheet_to_view.dart';
import 'package:timemanagment/Views/welcomScreen/widget/drawers.dart';
import 'package:timemanagment/constans/Colors.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(

          iconTheme: IconThemeData(color: CustomColors.myBlue),
          backgroundColor: CustomColors.white,
          elevation: 2.0,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(60))),
          title: Text(
            'Welcome',
            style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
          ),
          centerTitle: true,
        ),
        //drawer: navigationDrawer(),
        drawerScrimColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(children: <Widget>[
            Card(
              borderOnForeground: false,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 180.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/logsheet.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'LOG SHEETS',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ButtonBar(
                    buttonHeight: 100.0,
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Get.to(SelectSheetToView());
                        //  Get.snackbar('Lets Go', 'Have a Look at Logs');
                        },
                        child: const Text('VIEW LOGS'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(HomeScreen());
                        },
                        child: const Text('CREATE LOG'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
                height: 40,
                thickness: 1,
                indent: 9,
                endIndent: 9,
                color: Colors.black45),
            Card(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 180.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/timeanalysis.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          right: 16.0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Time Analysis',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ButtonBar(
                    buttonHeight: 100.0,
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                         // Get.snackbar('Lets Go', 'Have a Look at Logs');
                        },
                        child: const Text('SHARE'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View Analysis'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}