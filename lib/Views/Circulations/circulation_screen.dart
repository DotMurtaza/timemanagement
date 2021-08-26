import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Controller/CirculationController/circulation_controller.dart';
import 'package:timemanagment/Controller/CommonController/common_controller.dart';
import 'package:timemanagment/Models/LogSheetModel.dart';
import 'package:timemanagment/Views/SelectSheetToView/slect_sheet_to_view.dart';
import 'package:timemanagment/constans/Colors.dart';

class CirculationScreen extends StatelessWidget {
  CirculationScreen({Key key, this.logSheetModel, this.id}) : super(key: key);
  final LogSheetModel logSheetModel;
  final String id;
  final cicleController = Get.put(CirculationController());
  final commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(cicleController.startingDate);
    print(cicleController.endingDate);
    final difference = cicleController.endingDate
        .difference(cicleController.startingDate)
        .inMinutes;
    String stdTime = '90';
    int actTime = difference;
    //var check=difference>=90?'below':"above";

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
          'Circulation',
          style: TextStyle(color: CustomColors.myBlue, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: size.height / 1.9,
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: size.width,
                  //color: Colors.black,
                  height: size.height / 2,
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(

                                    // focusNode: AlwaysDisabledFocusNode(),
                                    controller:
                                        cicleController.startTimeController,
                                    onTap: () {
                                      cicleController.startTime(context);
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Start Time:',
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(

                                    // focusNode: AlwaysDisabledFocusNode(),
                                    controller:
                                        cicleController.endTimeController,
                                    onTap: () {
                                      cicleController.endTime(context);
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'End Time:',
                                      labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Center(
                                child: Text(
                              'Std. time : $stdTime min',
                              style: TextStyle(fontSize: 18),
                            )),
                          ),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(border: Border.all()),
                            child: Center(
                                child: difference == null
                                    ? Text('Loading...')
                                    : Text(
                                        'Diffrence Time is : ${actTime} min',
                                        style: TextStyle(fontSize: 18),
                                      )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('DownTime Losses : ',
                                style: TextStyle(fontSize: 18)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: cicleController.downTimeController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ), //Number_of_lines(int),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: size.width / 3.9,
                  child: Container(
                    width: 180,
                    height: 42,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        commonController.updateCirculation(
                            cicleController.startTimeController.text,
                            cicleController.endTimeController.text,
                            stdTime,
                            actTime,
                            cicleController.downTimeController.text);
                        cicleController.downTimeController.clear();
                        cicleController.startTimeController.clear();
                        cicleController.endTimeController.clear();
                        Get.back();
                      },
                      child: Text(
                        'Save',
                        style:
                            TextStyle(color: CustomColors.white, fontSize: 17),
                      ),
                      color: CustomColors.myBlue,
                    ),
                  )),
              // Positioned(
              //     right: 10,
              //     top: 0,
              //     child: MaterialButton(
              //       onPressed: () {
              //         cicleController.getCiculationStream(id);
              //         sopeController.getSopeSteam(id);
              //         Get.to(AllDetail());
              //       },
              //       child: Text(
              //         'see all record',
              //         style: TextStyle(
              //             decoration: TextDecoration.underline,
              //             color: Colors.redAccent,
              //             fontSize: 18),
              //       ),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
