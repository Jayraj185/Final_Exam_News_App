import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController
{
  TextEditingController txtSignInEmail = TextEditingController();
  TextEditingController txtSignInPass = TextEditingController();
  GlobalKey<FormState> SignInkey = GlobalKey<FormState>();
}