import 'package:final_exam/Screens/SignUpScreen/Controller/SignUpController.dart';
import 'package:final_exam/Utils/SharedPrefarence/Login_System.dart';
import 'package:final_exam/Utils/ToastMessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: signUpController.SignUpkey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.width/5),
                    child: Text(
                        "Please Create Account",
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.width/12),
                    child: Text(
                        "Sign Up",
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 33.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width/21,top: Get.width/4),
                  child: Text(
                      "Email",
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width/30,right: Get.width/30,top: Get.width/30),
                    child: TextFormField(
                      controller: signUpController.txtSignUpEmail,
                      cursorColor: Colors.purpleAccent,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey,width: 2)
                        ),
                        focusedBorder : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.purpleAccent,width: 2)
                        ),
                        hintText: "Email"
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                          {
                            return "Please Enter Your Email";
                          }
                        else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Please Enter Valid Email";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width/21,top: Get.width/12),
                  child: Text(
                    "Password",
                    style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width/30,right: Get.width/30,top: Get.width/30),
                    child: TextFormField(
                      controller: signUpController.txtSignUpPass,
                      cursorColor: Colors.purpleAccent,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                          focusedBorder : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.purpleAccent,width: 2)
                          ),
                          hintText: "Password"
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "Please Enter Your Password";
                        }
                        else if(value.length != 6)
                          {
                            return "Please Enter Password Max. 6 Character";
                          }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width/21,top: Get.width/12),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width/30,right: Get.width/30,top: Get.width/30),
                    child: TextFormField(
                      controller: signUpController.txtSignUpName,
                      cursorColor: Colors.purpleAccent,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                          focusedBorder : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.purpleAccent,width: 2)
                          ),
                          hintText: "Name"
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "Please Enter Your Name";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width/21,top: Get.width/12),
                  child: Text(
                    "Phone Number",
                    style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width/30,right: Get.width/30,top: Get.width/30),
                    child: TextFormField(
                      controller: signUpController.txtSignUpPhone,
                      cursorColor: Colors.purpleAccent,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey,width: 2)
                          ),
                          focusedBorder : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.purpleAccent,width: 2)
                          ),
                          hintText: "Phone Number"
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return "Please Enter Your Phone Number";
                        }
                        else if(value.length != 10)
                          {
                            return "Please Enter Valid Phone Number";
                          }
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.width/5),
                    child: InkWell(
                      onTap: (){
                        if(signUpController.SignUpkey.currentState!.validate())
                          {
                            Login_System.login_system.SignUp(email: signUpController.txtSignUpEmail.text, password: signUpController.txtSignUpPass.text);
                            Get.back();
                            ToastMessage.toastMessage.Message("Sign Up Successful", Colors.green);
                            signUpController.SignUpkey.currentState!.reset();
                          }
                        else
                          {
                            ToastMessage.toastMessage.Message("Please Enter Your Email or Password", Colors.red);
                          }
                      },
                      child: Container(
                        height: Get.height/15,
                        width: Get.width/2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.purpleAccent.shade100,
                              Colors.purpleAccent,
                            ]
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purpleAccent.shade100,
                              blurRadius: 15,
                              offset: Offset(0,0)
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 21.sp),),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.width/15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have Account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp
                          ),
                        ),
                        SizedBox(width : Get.width/60,),
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 12.sp
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
