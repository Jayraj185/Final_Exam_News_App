import 'package:final_exam/Screens/DetailScreen/Controller/DeatilController.dart';
import 'package:final_exam/Screens/DownloadScreen/Controller/DownloadController.dart';
import 'package:final_exam/Utils/DBHelper/DBHelper.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {

  DownloadController downloadController = Get.put(DownloadController());
  DetailController detailController = Get.put(DetailController());

  @override
  void initState() {
    super.initState();
    downloadController.GetDownNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Download News",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body: Obx(
              () => downloadController.DownloadNews.isNotEmpty
                  ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: downloadController.DownloadNews.length,
            itemBuilder: (context, index) {
              return FocusedMenuHolder(
                menuItems: [
                  FocusedMenuItem(title: Text("Delete"), onPressed: (){
                    DBHelper.dbHelper.DeleteDB(id: downloadController.DownloadNews[index].id!);
                    downloadController.GetDownNews();
                  })
                ],
                child: InkWell(
                  onTap: (){
                    detailController.downData!.value = downloadController.DownloadNews[index];
                    detailController.Check.value = 1;
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
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(0,0),
                                    blurRadius: 15
                                )
                              ]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network("${downloadController.DownloadNews[index].image}",fit: BoxFit.fill,),
                          ),
                        ),
                        Container(
                          height: Get.height/1.2,
                          width: Get.width/1.7,
                          margin: EdgeInsets.all(Get.width/30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
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
                                  "${downloadController.DownloadNews[index].name}",
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
                                  "${downloadController.DownloadNews[index].description}",
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
                ),
                onPressed: (){},
              );
            },
          )
                  : Center(child: Text("Please Download News",style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.bold,),),),
        ),
      ),
    );
  }
}
