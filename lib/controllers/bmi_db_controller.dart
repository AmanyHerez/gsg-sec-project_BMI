import 'package:project2_flutter_gsg/database/db_operation.dart';
import 'package:project2_flutter_gsg/database/db_provider.dart';
import 'package:project2_flutter_gsg/models/bmi_model.dart';
import 'package:sqflite/sqflite.dart';

class BmiDbController implements DbOperation{
  Database _database=DbProvider().database;
  @override
  Future<int> create(BmiModel bmi) async {
     await _database.insert(DbProvider.BMI_TABLE, bmi.toMap());
     return 0;
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows=await _database.delete(DbProvider.BMI_TABLE,where: 'id=?',whereArgs:[id] );
    return countOfDeletedRows>0;
  }

  @override
  Future<List<BmiModel>> read() async {
    List<Map<String,dynamic>> rows=await _database.query(DbProvider.BMI_TABLE);
    return rows.map((rowMap) => BmiModel.fromMap(rowMap)).toList();
  }

  @override
  Future show(int id) async {
    List<Map<String,dynamic>> rows=await _database.query(DbProvider.BMI_TABLE,where: 'id=?',whereArgs: [id]);
    return rows.isNotEmpty?BmiModel.fromMap(rows.first):null;
  }

  @override
  Future<bool> update(object) async {
    int countOfUpdatedRows=await _database.update(DbProvider.BMI_TABLE, object.toMap(),where: 'id=?',whereArgs: [object.id]);
    return countOfUpdatedRows>0;
  }
}