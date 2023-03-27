import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController
{
  TextEditingController txtSignUpEmail = TextEditingController();
  TextEditingController txtSignUpPass = TextEditingController();
  TextEditingController txtSignUpName = TextEditingController();
  TextEditingController txtSignUpPhone = TextEditingController();
  GlobalKey<FormState> SignUpkey = GlobalKey<FormState>();
}