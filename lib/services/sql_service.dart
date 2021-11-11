import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_example/model/user.dart';

class SqfliteService {
  static late Database database;
  static Future<void> createDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "sqflite.db";
    database = await openDatabase(path);
    await createTable();
  }

  static Future<void> createTable() async {
    await database.execute('CREATE TABLE SQFLITE (first_name TEXT, last_name TEXT)');
  }

  static Future<void> insertData({required User user}) async {
    await database
        .rawInsert('INSERT INTO SQFLITE(first_name, last_name) VALUES("${user.firstName}", "${user.lastName}")');
  }

  static Future<void> deleteData({required String firstName}) async {
    await database.rawDelete('DELETE FROM SQFLITE WHERE first_name = "$firstName"');
  }

  static Future<void> updateData({required User user}) async {
    await database
        .rawUpdate('UPDATE SQFLITE SET last_name = "${user.lastName}" WHERE first_name = "${user.firstName}"');
  }

  static Future<User> getData({required String firstName}) async {
    List<Map> list = await database.rawQuery('SELECT * FROM SQFLITE WHERE first_name = "$firstName"');

    return User(
        firstName: list.length > 0 ? list[0]['first_name'] : "", lastName: list.length > 0 ? list[0]['last_name'] : "");
  }

  static Future<void> closeDB() async {
    await database.close();
  }
}
