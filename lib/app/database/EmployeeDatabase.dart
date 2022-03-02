import 'dart:async';
import 'package:employee_app/app/database/EmployeeDao.dart';
import 'package:employee_app/app/database/EmployeeEntity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';// ted
part 'EmployeeDatabase.g.dart'; // the genera
// ted code will be there

@Database(version: 1, entities: [EmployeeEntity])
abstract class EmployeeDatabase extends FloorDatabase {
  EmployeeDao get databaseDao;
}