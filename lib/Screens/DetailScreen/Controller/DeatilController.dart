import 'package:final_exam/Screens/DownloadScreen/Model/DownloadNowsModel.dart';
import 'package:final_exam/Screens/HomeScreen/Model/NewsModel.dart';
import 'package:get/get.dart';

class DetailController extends GetxController
{

  Rx<Articles>? articles = Articles().obs;
  Rx<DownNewsModel>? downData = DownNewsModel().obs;
  RxInt Check = 0.obs;

}