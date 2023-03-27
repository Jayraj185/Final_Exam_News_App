import 'package:final_exam/Screens/DetailScreen/Controller/DeatilController.dart';
import 'package:final_exam/Screens/DownloadScreen/Controller/DownloadController.dart';
import 'package:final_exam/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:final_exam/Screens/HomeScreen/Model/NewsModel.dart';
import 'package:final_exam/Utils/ApiHelper/ApiHelper.dart';
import 'package:final_exam/Utils/SharedPrefarence/Login_System.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController homeController = Get.put(HomeController());
  DownloadController downloadController = Get.put(DownloadController());
  DetailController detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("News 24/7",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          leading: Padding(
            padding:  EdgeInsets.only(left: Get.width/60),
            child: IconButton(
              onPressed: (){
                Login_System.login_system.CheckSignup(Login: false);
                Get.offNamed("SignIn");
              },
              icon: Icon(Icons.logout),
            ),
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.only(right: Get.width/50),
              child: IconButton(
                onPressed: (){
                  Get.toNamed("Download");
                },
                icon: Icon(Icons.download_for_offline,size: 21.sp,),
              ),
            ),
          ],
          backgroundColor: Colors.purpleAccent,
        ),
        body: FutureBuilder<NewsModel?>(
          future: ApiHelper.apiHelper.GetNewsData(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Center(child: Text("${snapshot.error}"),);
              }
            else if(snapshot.hasData)
              {
                homeController.NewsList!.value = snapshot.data!.articles!;
                return Obx(
                    () => ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: homeController.NewsList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          detailController.articles!.value = homeController.NewsList![index];
                          detailController.Check.value = 0;
                          Get.toNamed('Detail');
                        },
                        child: Container(
                          height: Get.height/6,
                          width: Get.width,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: Get.height/1.2,
                                width: Get.width/3.3,
                                margin: EdgeInsets.only(top: Get.width/30,left: Get.width/30,bottom: Get.width/30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(0,0),
                                          blurRadius: 15
                                      )
                                    ]
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network("${homeController.NewsList![index].urlToImage}",fit: BoxFit.fill,),
                                ),
                              ),
                              Container(
                                height: Get.height/1.2,
                                width: Get.width/1.7,
                                margin: EdgeInsets.all(Get.width/30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(0,0),
                                          blurRadius: 15
                                      )
                                    ]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: Get.width/30,top: Get.width/60),
                                      child: Text(
                                        "${homeController.NewsList![index].source!.name}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: Get.width/30,top: Get.width/90,right: Get.width/30),
                                      child: Text(
                                        "${homeController.NewsList![index].description}",
                                        maxLines: 4,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp,
                                            overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            return Center(child: CircularProgressIndicator(color: Colors.purpleAccent,),);
          },
        )
      ),
    );
  }
}
