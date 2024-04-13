import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_usha/app/routes/app_pages.dart';

import '../../utils/scale_utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAndToNamed(Routes.HOME);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      body: Container(
        width: scale.fw,
        height: scale.fh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              MediaQuery.of(context).platformBrightness == Brightness.dark ? 'assets/app_logo_dark.svg': 'assets/app_logo.svg',
              height: scale.getScaledHeight(78),
            ),
            SizedBox(height: scale.getScaledHeight(10)),
            Text(
              "Fitness",
              style: TextStyle(
                fontSize: scale.getScaledFont(20),
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito',
                color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
