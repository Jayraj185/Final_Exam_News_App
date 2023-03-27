import 'package:final_exam/Screens/DetailScreen/Controller/DeatilController.dart';
import 'package:final_exam/Screens/DownloadScreen/Controller/DownloadController.dart';
import 'package:final_exam/Screens/DownloadScreen/Model/DownloadNowsModel.dart';
import 'package:final_exam/Utils/DBHelper/DBHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  DetailController detailController = Get.put(DetailController());
  DownloadController downloadController = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("${detailController.Check.value == 0 ? detailController.articles!.value.source!.name : detailController.downData!.value.name}",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          actions: [
            detailController.Check.value == 0
                ? Padding(
              padding:  EdgeInsets.only(right: Get.width/50),
              child: IconButton(
                onPressed: (){
                  DownNewsModel downNewsModel = DownNewsModel(
                    author: detailController.articles!.value.author,
                    name: detailController.articles!.value.source!.name,
                    image: detailController.articles!.value.urlToImage,
                    title: detailController.articles!.value.title,
                    description: detailController.articles!.value.description,
                    content: detailController.articles!.value.content,
                  );
                  DBHelper.dbHelper.InsertDB(downNewsModel: downNewsModel);
                  Get.back();
                },
                icon: Icon(Icons.download,size: 21.sp,),
              ),
            )
                : Text(""),
          ],
          backgroundColor: Colors.purpleAccent,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: Get.height/1.5,
                width: Get.width/1.1,
               padding: EdgeInsets.symmetric(horizontal: Get.width/21),
               margin: EdgeInsets.only(top: Get.width/3),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey,
                     blurRadius: 15,
                     offset: Offset(0,0)
                   )
                 ]
               ),
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: Get.width/2.8),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "${detailController.Check.value == 0 ? detailController.articles!.value.author : detailController.downData!.value.author}",
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.width/21,),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Description :",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.width/30,),
                        child: Text(
                          "${detailController.Check.value == 0 ? detailController.articles!.value.description : detailController.downData!.value.description}",
                          maxLines: 9,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.width/21,),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Content :",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.width/30,),
                        child: Text(
                          "${detailController.Check.value == 0 ? detailController.articles!.value.content : detailController.downData!.value.content}",
                          maxLines: 9,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: Get.height/4.3,
                width: Get.width/2.8,
                margin: EdgeInsets.only(top: Get.width/5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15,
                          offset: Offset(0,0)
                      )
                    ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network('${detailController.Check.value == 0 ? detailController.articles!.value.urlToImage : detailController.downData!.value.image}',fit: BoxFit.fill,),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
