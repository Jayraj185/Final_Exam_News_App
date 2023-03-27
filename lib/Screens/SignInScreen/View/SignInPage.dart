import 'package:final_exam/Screens/SignInScreen/Controller/SignInController.dart';
import 'package:final_exam/Utils/SharedPrefarence/Login_System.dart';
import 'package:final_exam/Utils/ToastMessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  
  SignInController signInController = Get.put(SignInController());
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: signInController.SignInkey,
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
                      "Welcome To News 24/7",
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
                      "Sign In",
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
                      controller: signInController.txtSignInEmail,
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
                      controller: signInController.txtSignInPass,
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.width/5),
                    child: InkWell(
                      onTap: () async {
                        if(signInController.SignInkey.currentState!.validate())
                        {
                          Map loginData = await Login_System.login_system.ReadSignUp();
                          print("========== $loginData");
                          if(loginData['email'] == signInController.txtSignInEmail.text && loginData['password'] == signInController.txtSignInPass.text)
                            {
                              Login_System.login_system.CheckSignup(Login: true);
                              Get.offNamed('Home');
                              ToastMessage.toastMessage.Message("Sign In Successful", Colors.green);
                              signInController.SignInkey.currentState!.reset();
                            }
                          else
                            {
                              ToastMessage.toastMessage.Message("Email or Password are wrong", Colors.red);
                            }
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
                        child: Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 21.sp),),
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
                          "Don't Have Account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp
                          ),
                        ),
                        SizedBox(width : Get.width/60,),
                        InkWell(
                          onTap: (){
                            Get.toNamed('SignUp');
                          },
                          child: Text(
                            "Sign Up",
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
        ),
      ),
    );
  }
}
