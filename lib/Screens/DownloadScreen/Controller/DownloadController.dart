import 'package:final_exam/Screens/DownloadScreen/Model/DownloadNowsModel.dart';
import 'package:final_exam/Screens/HomeScreen/Model/NewsModel.dart';
import 'package:final_exam/Utils/DBHelper/DBHelper.dart';
import 'package:get/get.dart';

class DownloadController extends GetxController
{

  RxList<DownNewsModel> DownloadNews = <DownNewsModel>[].obs;

  void GetDownNews()async
  {
    DownloadNews.value = await DBHelper.dbHelper.ReadDB();
  }

}