import 'dart:io';
import 'package:final_exam/Screens/DownloadScreen/Model/DownloadNowsModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBHelper
{
  //Singleton
  DBHelper._();

  static DBHelper dbHelper = DBHelper._();

  //Create Database Object
  Database? database;

  //Check Databse Create or Not
  Future<Database?> CheckDB() async
  {
    if(database != null)
      {
        return database;
      }
    else
      {
        return await CreateDB();
      }
  }

  //Create Databse
  Future<Database> CreateDB() async
  {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,'down_news.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query = "CREATE TABLE down_news (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, author TEXT, title TEXT, description TEXT, image TEXT, content TEXT)";
        db.execute(query);
      },
    );
  }

  //Insert Data In Database
  Future<void> InsertDB({required DownNewsModel downNewsModel})
  async {
    database = await CheckDB();
    database!.insert('down_news', {
      'name' : downNewsModel.name,
      'author' : downNewsModel.author,
      'title' : downNewsModel.title,
      'description' : downNewsModel.description,
      'image' : downNewsModel.image,
      'content' : downNewsModel.content,
    });
  }

  //Read Data In Database
  Future<List<DownNewsModel>> ReadDB() async
  {
    database = await CheckDB();
    String query = "SELECT * FROM down_news";
    List<Map> data = await database!.rawQuery(query);

    List<DownNewsModel> DownList = data.map((e) => DownNewsModel().fromJson(e)).toList();

    return DownList;

  }

  //Delete Data In Database
  void DeleteDB({required int id}) async
  {
    database = await CheckDB();

    database!.delete("down_news",where: "id = ?",whereArgs: [id]);
  }
}