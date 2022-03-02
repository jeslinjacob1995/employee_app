
import 'package:employee_app/app/database/EmployeeEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class EmployeeDao {

  @insert
  Future<void> insertContent(EmployeeEntity employeeEntity);

  @Query('SELECT * FROM EmployeeEntity')
  Future<List<EmployeeEntity>> findAllPersons();

  @Query("SELECT * FROM EmployeeEntity WHERE name LIKE :keyword OR email LIKE :keyword")
  Future<List<EmployeeEntity>> getSearchData(String keyword,);

}