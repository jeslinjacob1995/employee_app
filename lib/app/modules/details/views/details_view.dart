import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      appBar: AppBar(
        title: Text('DetailsView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  width: Get.width,
                  height: 200,
                  child: Image.network(controller.employeeData.profileImage?? "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",fit: BoxFit.cover,)),
              detailsArea(name: "name",value: controller.employeeData.name),
              detailsArea(name: "username",value: controller.employeeData.username),
              detailsArea(name: "email",value: controller.employeeData.email),
              detailsArea(name: "phone",value: controller.employeeData.phone),
              detailsArea(name: "website",value: controller.employeeData.website),
              detailsArea(name: "City",value: controller.employeeData.address == null ? "Not available" :controller.employeeData.address!.city  ),
              detailsArea(name: "Company Name",value: controller.employeeData.company == null ? "Not available" :controller.employeeData.company!.name  ),

            ],
          ),
        ),
      ),
    );
  }

  Widget detailsArea({String? name, String? value}){
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
      child: Row(
        children: [
          Text(name!,style: TextStyle(fontWeight: FontWeight.bold),),
          Spacer(),
          Text(value ?? "Not available")
        ],
      ),
    );
  }

}
