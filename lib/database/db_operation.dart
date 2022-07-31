import 'dart:async';

import 'package:project2_flutter_gsg/models/bmi_model.dart';
abstract class DbOperation<T>{
  ///crate all item in database
  Future<int> create(BmiModel object);
  ///read all item in database
  Future<List<T>> read();
  ///update on item in database new version
  Future<bool> update(T object);
///delete on item in database
  Future<bool> delete(int id);
  ///show specific in database
 Future<T?> show(int id);
}