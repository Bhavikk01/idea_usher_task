import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:task_usha/app/modules/home/widgets/stepCard.dart';

import '../../../utils/scale_utility.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.black : Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Hi!',
          style: TextStyle(
            fontSize: scale.getScaledFont(24),
            fontFamily: 'Nunito',
            color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: scale.getMargin(horizontal: 20, vertical: 10),
            padding: scale.getPadding(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: MediaQuery.of(context).platformBrightness == Brightness.dark ? const Color(0xff323232) : const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(scale.getScaledFont(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => RichText(
                    text: TextSpan(
                        text: 'Steps: ',
                        style: TextStyle(
                          fontSize: scale.getScaledFont(14),
                          color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Nunito',
                        ),
                        children: [
                          TextSpan(
                            text: '${controller.totalFoot.value}',
                            style: TextStyle(
                              fontSize: scale.getScaledFont(16),
                              color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Nunito',
                            ),
                          )
                        ]
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: scale.getScaledHeight(20),
                          width: scale.getScaledWidth(220),
                          margin: scale.getMargin(top: 6, bottom: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(scale.getScaledFont(10)),
                            child: Obx(
                              () => LinearProgressIndicator(
                                value: (controller.totalFoot.value > 1200 ? 1200/1200 : controller.totalFoot.value/1200).toDouble(),
                                backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? const Color(0xff8A8A8A)
                                    : const Color(0xffC4C4C4),
                                borderRadius: BorderRadius.circular(scale.getScaledFont(20)),
                                valueColor: MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? const AlwaysStoppedAnimation<Color>(Colors.white)
                                    : const AlwaysStoppedAnimation<Color>(Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: scale.getScaledWidth(220),
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Text(
                                    '${controller.totalFoot.value}',
                                    style: TextStyle(
                                      fontSize: scale.getScaledFont(10),
                                      color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ),
                                Text(
                                  'Goal: 1200',
                                  style: TextStyle(
                                    fontSize: scale.getScaledFont(10),
                                    color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/footStep.svg',
                      width: scale.getScaledWidth(60),
                      color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                      height: scale.getScaledHeight(40),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: scale.getMargin(horizontal: 20, vertical: 10),
            padding: scale.getPadding(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: MediaQuery.of(context).platformBrightness == Brightness.dark ? const Color(0xff323232) : const Color(0xfff0f0f0),
              borderRadius: BorderRadius.circular(scale.getScaledFont(24)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => RichText(
                    text: TextSpan(
                        text: 'Calories: ',
                        style: TextStyle(
                          fontSize: scale.getScaledFont(14),
                          color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Nunito',
                        ),
                        children: [
                          TextSpan(
                            text: '${controller.totalCalori.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: scale.getScaledFont(16),
                              color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Nunito',
                            ),
                          )
                        ]
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: scale.getScaledHeight(20),
                          width: scale.getScaledWidth(220),
                          margin: scale.getMargin(top: 6, bottom: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(scale.getScaledFont(10)),
                            child: Obx(
                              () => LinearProgressIndicator(
                                value: (controller.totalCalori.value > 12000 ? 12000/12000 : controller.totalCalori.value/12000).toDouble(),
                                backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ? const Color(0xff8A8A8A)
                                  : const Color(0xffC4C4C4),
                                borderRadius: BorderRadius.circular(scale.getScaledFont(20)),
                                valueColor: MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ? const AlwaysStoppedAnimation<Color>(Colors.white)
                                  : const AlwaysStoppedAnimation<Color>(Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: scale.getScaledWidth(220),
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                 () => Text(
                                    '${controller.totalCalori.value.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: scale.getScaledFont(10),
                                      color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ),
                                Text(
                                  'Goal: 12000',
                                  style: TextStyle(
                                    fontSize: scale.getScaledFont(10),
                                    color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/calories.svg',
                      width: scale.getScaledWidth(60),
                      color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
                      height: scale.getScaledHeight(40),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
