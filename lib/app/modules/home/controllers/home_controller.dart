import 'dart:convert';

import 'package:employee_app/app/data/EmployeeListResponse.dart';
import 'package:employee_app/app/database/EmployeeDao.dart';
import 'package:employee_app/app/database/EmployeeDatabase.dart';
import 'package:employee_app/app/database/EmployeeEntity.dart';
import 'package:employee_app/app/network/ApiConnector.dart';
import 'package:employee_app/app/network/storage.dart';
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  ApiConnector connector = ApiConnector();
  GlobalKey key = GlobalKey();
  RxList<EmployeeData> employeeList = <EmployeeData>[].obs;
  RxBool loadData = true.obs;
  RxString dataLoadedFrom = "".obs;
  late EmployeeDao employeeDao;
  @override
  void onInit() {
    super.onInit();

    initialLoad();

  }

  initialLoad(){
    Future.delayed(Duration(seconds: 1),() async{
      employeeDao = Get.find<Storage>().getDb()!.databaseDao;
      List<EmployeeEntity> tableData = await employeeDao.findAllPersons();
      if (tableData.isEmpty) {
        getAllEmployeeDetails();
      }

      loadData.value = false;
      if (employeeList.isEmpty && tableData.isNotEmpty) {
        dataLoadedFrom.value = " Data loaded from Table";
        for (var employee in tableData) {

          Address? address = employee.address == "null" ? null : Address.fromJson(jsonDecode(employee.address!));
          Company? company = employee.company == "null" ? null : Company.fromJson(jsonDecode(employee.company!));
          employeeList.add(EmployeeData(id: employee.id,name: employee.name,
              username: employee.username,email: employee.email,profileImage: employee.profileImage,
              address: address ,phone: employee.phone,
              website: employee.website,company: company
          ));
        }

      }
    });
  }
  getAllEmployeeDetails() async{

    Response response = await connector.getUser();
    EmployeeListResponse employeeListResponse = EmployeeListResponse.fromList(response.body);
    employeeList.addAll(employeeListResponse.employeeList!);

    for (var element in employeeList) {
      employeeDao.insertContent(EmployeeEntity(name: element.name,
          username: element.username,email: element.email,profileImage: element.profileImage,
          address: jsonEncode(element.address?.toJson()),phone: element.phone,
          company: jsonEncode(element.company?.toJson())
      ));
    }
    dataLoadedFrom.value = "Data Loaded From API";
  }


  @override
  void onClose() {
    searchController.dispose();
  }

  search() async{
    employeeList.clear();
    if (searchController.text == "") {
      initialLoad();
    }else{
      loadData.value = true;
      List<EmployeeEntity> searchData = await  employeeDao.getSearchData('%${searchController.text}%');
      for (var employee in searchData) {
        Address? address = employee.address == "null" ? null : Address.fromJson(jsonDecode(employee.address!));
        Company? company = employee.company == "null" ? null : Company.fromJson(jsonDecode(employee.company!));
        employeeList.add(EmployeeData(id: employee.id,name: employee.name,
            username: employee.username,email: employee.email,profileImage: employee.profileImage,
            address: address ,phone: employee.phone,
            website: employee.website,company: company
        ));
      }
      loadData.value = false;
    }

  }
}
