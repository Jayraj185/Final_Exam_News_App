import 'dart:convert';

import 'package:final_exam/Screens/HomeScreen/Model/NewsModel.dart';
import 'package:http/http.dart' as http;
class ApiHelper
{
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

  Future<NewsModel?> GetNewsData() async
  {
    String apiLink = "https://newsapi.org/v2/everything?q=india&from=${DateTime.now().year}-${DateTime.now().month}-01&to=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=popularity&apiKey=3d51c2a34fb44d3c8fac807874dc343a";
    var response = await http.get(Uri.parse(apiLink));
    if(response.statusCode == 200)
      {
        var json = jsonDecode(response.body);
       // Map jsonData = json;
        return NewsModel.fromJson(json);
      }
    else
      {
        return null;
      }
  }
}