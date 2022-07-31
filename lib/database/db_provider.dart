import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DbProvider {
  static final DbProvider _instance = DbProvider._internal();
  late Database _database;

  factory DbProvider() {
    return _instance;
  }
  static const  BMI_TABLE='BMI';
  DbProvider._internal();
  Database get database=> _database;
  Future<void> initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) {
        db.execute("CREATE TABLE BMI("
            "id INTEGER PRIMARY KEY AUTOINCREMENT"
            "height TEXT"
            "weight TEXT"
            ")");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
