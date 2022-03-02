import 'package:employee_app/app/database/EmployeeDatabase.dart';
abstract class Storage {

  EmployeeDatabase ? getDb();

}


class StorageImpl implements Storage{
  EmployeeDatabase ? database;

  StorageImpl(){
    $FloorEmployeeDatabase.databaseBuilder('app_database.db').build().then((value) =>
    database = value
    );
  }



  @override
  EmployeeDatabase? getDb() {
    return database;
  }
}