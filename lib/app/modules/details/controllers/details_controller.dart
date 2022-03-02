import 'package:employee_app/app/data/EmployeeListResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  late EmployeeData employeeData;
  GlobalKey key = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    employeeData = Get.arguments;
    printInfo(info: "sada");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
