import 'package:final_exam/Screens/DetailScreen/View/DetailPage.dart';
import 'package:final_exam/Screens/DownloadScreen/View/DownloadPage.dart';
import 'package:final_exam/Screens/HomeScreen/View/HomePage.dart';
import 'package:final_exam/Screens/SignInScreen/View/SignInPage.dart';
import 'package:final_exam/Screens/SignUpScreen/View/SignUpPage.dart';
import 'package:final_exam/Screens/SplashScreen/View/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (p0) => SplashPage(),
          'SignIn' : (p0) => SignInPage(),
          'SignUp' : (p0) => SignUpPage(),
          'Home' : (p0) => HomePage(),
          'Download' : (p0) => DownloadPage(),
          'Detail' : (p0) => DetailPage(),
        },
      ),
    )
  );
}