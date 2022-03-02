
import 'package:floor/floor.dart';

@entity
class EmployeeEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? name;
  String? username;
  final String? email;
  String? profileImage;
  String ? address;
  String? phone;
  String? website;
  String ? company;

  EmployeeEntity(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.profileImage,
      this.address,
      this.phone,
      this.website,
      this.company});


}
