import 'package:shared_preferences/shared_preferences.dart';

class Login_System
{
  Login_System._();
  static Login_System login_system = Login_System._();
  //Login System
  void SignUp({required String email, required String password}) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("email", email);
    preferences.setString("password", password);
  }

  Future<Map> ReadSignUp() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? email = preferences.getString('email');
    String? password = preferences.getString('password');
    Map signupData = {'email' : email, 'password' : password};
    return signupData;
  }

  //Check SignUp or Not
  void CheckSignup({required bool Login}) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("login", Login);
  }

  Future<bool?> ReadCheckSignUp() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? login = preferences.getBool('login');
    return login;
  }
}