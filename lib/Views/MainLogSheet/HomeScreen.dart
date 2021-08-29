import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CommonController/common_controller.dart';
import 'package:timemanagment/Controller/HomeScreenController/HomeScreenController.dart';
import 'package:timemanagment/Controller/LogOutController/logout_controller.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Views/Userprofile/user-file.dart';
import 'package:timemanagment/constans/Colors.dart';

import '../../Controller/HomeScreenController/HomeScreenController.dart';
import '../CategoryScreen/categoryScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> _myKey = GlobalKey<FormState>();
  final logoutController = Get.put(LogOutController());
  final userController = Get.put(UserController());
  final commonController = Get.put(CommonController());
  final homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final homeController = Get.put(HomeScreenController());
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: CustomColors.myBlue,
                ),
                child: Text('User name')),
            ListTile(
              title: const Text('User profile'),
              onTap: () {
                Get.to(Userprofile());
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                logoutController.signOut();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomColors.myBlue),
        backgroundColor: CustomColors.white,
        elevation: 2.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Saponification Log Sheet',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            children: [
              Form(
                  key: _myKey,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Card(
                          elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: TextFormField(
                              style: TextStyle(fontSize: 18),
                              focusNode: AlwaysDisabledFocusNode(),
                              controller: homeController.dateController,
                              validator: (value) {
                                return homeController.validateDate(value);
                              },
                              onTap: () {
                                homeController.selectDate(context);
                              },
                              decoration: InputDecoration(
                                  prefix: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2, top: 0),
                                    child: Icon(Icons.calendar_today_rounded),
                                  ),
                                  labelText: 'Date :',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2, left: 10),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Shift:',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                                DropdownButtonFormField(
                                  hint: homeController.dropDownValue == null
                                      ? Text('Dropdown')
                                      : Text(
                                          homeController.dropDownValue.value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                  isExpanded: true,
                                  iconSize: 20.0,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  items: ['1st', '2nd', '3rd'].map(
                                    (val) {
                                      return DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      );
                                    },
                                  ).toList(),
                                  validator: (value) {
                                    return homeController.validateShift(value);
                                  },
                                  onChanged: (val) {
                                    homeController.dropDownValue.value = val;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: 22),
                              validator: (value) {
                                return homeController.validateBase(value);
                              },
                              controller: homeController.baseController,
                              decoration: InputDecoration(
                                  labelText: 'Base:',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: 22),
                              validator: (value) {
                                return homeController.validateBiloNo(value);
                              },
                              controller: homeController.boilNoController,
                              decoration: InputDecoration(
                                  labelText: 'Boil No:',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: 22),
                              validator: (value) {
                                return homeController.validatePanlNo(value);
                              },
                              controller: homeController.panlController,
                              decoration: InputDecoration(
                                  labelText: 'Panl No:',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: 22),
                              validator: (value) {
                                return homeController.validateFatChange(value);
                              },
                              controller: homeController.fatController,
                              decoration: InputDecoration(
                                  labelText: 'Fat change:',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: 22),
                              validator: (value) {
                                return homeController.validateStartTime(value);
                              },
                              focusNode: AlwaysDisabledFocusNode(),
                              controller: homeController.startTimeController,
                              onTap: () {
                                homeController.startTime(context);
                              },
                              decoration: InputDecoration(
                                  labelText: 'Start Time:',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: 22),
                              validator: (value) {
                                return homeController.validateEndingTime(value);
                              },
                              focusNode: AlwaysDisabledFocusNode(),
                              controller: homeController.endTimeController,
                              onTap: () async {
                                homeController.endTime(context);
                              },
                              decoration: InputDecoration(
                                  labelText: 'End Time:',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: 22),
                              validator: (value) {
                                return homeController.validateOperator(value);
                              },
                              controller: homeController.operatorController,
                              decoration: InputDecoration(
                                  labelText: 'Operator:',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(elevation:5,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(fontSize: 22),
                              validator: (value) {
                                return homeController.validateSampleNo(value);
                              },
                              controller: homeController.sampleController,
                              decoration: InputDecoration(
                                  labelText: 'Sample No:',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  border: UnderlineInputBorder()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          commonController.onContinue(formKey: _myKey);

          //homeController.onContinue(formKey: _myKey);
        },
        label: Text(
          "Continue..",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
