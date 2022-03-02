import 'package:employee_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      appBar: AppBar(
        title: Text('Employee app'),
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              children: [
                searchArea(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(controller.dataLoadedFrom.value,style: TextStyle(color: Colors.green),),
                ),
                Obx(()=>Expanded(
                    child: ListView.builder(itemBuilder: (ctx,index){
                      return ListTile(
                        leading: Image.network(controller.employeeList[index].profileImage ?? "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg"),
                        title: Text(controller.employeeList[index].name!),
                        subtitle:
                        controller.employeeList[index].company != null ?
                        Text(controller.employeeList[index].company!.name!) :
                        Text("Company Data not available"),
                        onTap: ()=>Get.toNamed(Routes.DETAILS,
                            arguments:controller.employeeList[index]),
                      );
                    },itemCount: controller.employeeList.length,)
                ))

              ],
            ),
            Obx(()=>Visibility(
              visible: controller.loadData.value,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ))

          ],
        ),
      ),
    );
  }
  
  Widget searchArea(){
    return Row(
      children: [
        Expanded(child: TextField(
          controller: controller.searchController,
          decoration: InputDecoration(hintText: "Search here",hintStyle: TextStyle(color: Colors.grey)),)),
        IconButton(onPressed: ()=>controller.search(), icon: Icon(Icons.search),color: Colors.blue,)
      ],
    );
  }
}
