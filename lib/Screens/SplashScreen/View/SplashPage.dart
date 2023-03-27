import 'package:final_exam/Screens/SplashScreen/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    splashController.IsLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: Get.width/2.6),
                child: Text(
                  "Welcome To News 24/7",
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: Get.height/4,
                width: Get.height/4,
                alignment: Alignment.center,
                child: Lottie.asset("assets/animation/news.json"),
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Get.width/5.6),
                child: Text(
                  "  from",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Get.width/9),
                child: Text(
                  "Jayraj",
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: Get.width/3),
                child: CircularProgressIndicator(color: Colors.purpleAccent,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
