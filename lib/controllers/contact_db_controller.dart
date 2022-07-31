//
// import 'package:project2_flutter_gsg/database/db_operation.dart';
// import 'package:project2_flutter_gsg/database/db_provider.dart';
// import 'package:project2_flutter_gsg/models/contact.dart';
// import 'package:sqflite/sqflite.dart';
//
// class ContactDbController implements DbOperation{
//   Database _database=DbProvider().database;
//   @override
//   Future<int> create(object) async{
//     return await _database.insert(DbProvider.CONTACT_TABLE, object.toMap());
//   }
//   @override
//   Future<bool> delete(int id) async{
//  int countOfDeletedRows=await _database.delete(DbProvider.CONTACT_TABLE,where: 'id=?',whereArgs:[id] );
//  return countOfDeletedRows>0;
//   }
//   @override
//   Future<List<Contact>> read()async {
//     List<Map<String,dynamic>> rows=await _database.query(DbProvider.CONTACT_TABLE);
//     return rows.map((rowMap) => Contact.fromMap(rowMap)).toList();
//   }
//   @override
//   Future show(int id) async{
//     List<Map<String,dynamic>> rows=await _database.query(DbProvider.CONTACT_TABLE,where: 'id=?',whereArgs: [id]);
//     return rows.isNotEmpty?Contact.fromMap(rows.first):null;
//   }
//   @override
//   Future<bool> update(object) async {
//     int countOfUpdatedRows=await _database.update(DbProvider.CONTACT_TABLE, object.toMap(),where: 'id=?',whereArgs: [object.id]);
//     return countOfUpdatedRows>0;
//   }
// }