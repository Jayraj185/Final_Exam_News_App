import 'dart:async';

import 'package:final_exam/Utils/SharedPrefarence/Login_System.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
{
  void IsLogin() async
  {
    bool? login = await Login_System.login_system.ReadCheckSignUp();
    if(login != null)
      {
        if(login)
          {
            Timer(Duration(seconds: 3), () {
              Get.offNamed('Home');
            });
          }
        else
          {
            Timer(Duration(seconds: 3), () {
              Get.offNamed('SignIn');
            });
          }
      }
    else
    {
      Timer(Duration(seconds: 3), () {
        Get.offNamed('SignIn');
      });
    }
  }
}