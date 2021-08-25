import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timemanagment/Views/Analysis/analysis_screen.dart';
import 'package:timemanagment/Views/CategoryScreen/Widgets/itemWidget.dart';
import 'package:timemanagment/Views/Circulations/circulation_screen.dart';
import 'package:timemanagment/Views/Soponification/soponification.dart';
import 'package:timemanagment/constans/Colors.dart';

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Soap Making Department',
                      textStyle: TextStyle(
                        color: CustomColors.white,
                        //   color: CustomColors.myBlue,
                        fontSize: 27,
                      )),
                ],
                isRepeatingAnimation: true,
              ),
            ),
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
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ImtemWidget(
                                  text: 'Sponification',
                                  image: 'assets/images/soap.jpeg',
                                )),
                            onTap: () {
                              Get.to(Soponification(id: id,));
                            },
                          ),
                          GestureDetector(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ImtemWidget(
                                  text: 'Circulation',
                                  image: 'assets/images/circulation.jpeg',
                                )),
                            onTap: (){Get.to(CirculationScreen(id: id,));},
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ImtemWidget(
                                  text: 'Quantity of ingredient',
                                  image: 'assets/images/ingrdient.jpeg',
                                )),
                            onTap: () {},
                          ),
                          GestureDetector(
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ImtemWidget(
                                  text: 'Analysis',
                                  image: 'assets/images/analysis.jpeg',
                                )),
                            onTap: () {
                              Get.to(AnalysisScreen());
                            },
                          )
                        ],
                      )
                    ],
                  )

                  ),
            ),
          ],
        ),
      ),
    );
  }
}
