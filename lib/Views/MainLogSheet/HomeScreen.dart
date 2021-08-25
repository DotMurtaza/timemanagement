
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/HomeScreenController/HomeScreenController.dart';
import 'package:timemanagment/Controller/LogOutController/logout_controller.dart';
import 'package:timemanagment/Controller/user_controller.dart';
import 'package:timemanagment/Views/Userprofile/user-file.dart';
import 'package:timemanagment/constans/Colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> _myKey = GlobalKey<FormState>();
  final logoutController = Get.put(LogOutController());
  final userController = Get.put(UserController());

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
              title: const Text('Statistics'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
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
        elevation: 10.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60))),
        title: Text(
          'Sponification Log Sheet',
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        TextFormField(
                          focusNode: AlwaysDisabledFocusNode(),
                          controller: homeController.dateController,
                          validator: (value) {
                            return homeController.validateDate(value);
                          },
                          onTap: () {
                            homeController.selectDate(context);
                          },
                          decoration: InputDecoration(
                              labelText: 'Date:',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Shift:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButtonFormField(
                            hint: homeController.dropDownValue == null
                                ? Text('Dropdown')
                                : Text(
                                    homeController.dropDownValue.value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.black, fontSize: 18),
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
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
          homeController.onContinue(formKey: _myKey);
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
