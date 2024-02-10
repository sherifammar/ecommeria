import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/catogeriescontroller/catsview_controller.dart';
import '../../../linkapi.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    CatogeriesViewcontroller controller = Get.put(CatogeriesViewcontroller());
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){controller.goToaddcats();},child: Icon(Icons.add),),
        appBar: AppBar(
          title: Text("Catogeries"),
        ),
        body: GetBuilder<CatogeriesViewcontroller>(
            builder: (controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: WillPopScope(
                    onWillPop: () {
                       return controller.goToback();
                    },
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) => Card(
                        child: Row(children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: SvgPicture.network(
                                "${AppLink.imagelink}/cats/${controller.data[index].categoriesImage}",
                                color: ColorAPP.secoandColor,
                                height: 50,
                                width: 40,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: ListTile(
                                title:
                                    Text(controller.data[index].categoriesName!),
                                subtitle: Text(
                                    controller.data[index].categoriesDatetime!),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(onPressed: (){
                                          Get.defaultDialog(title: "warn",middleText: "You Want Delet categories",onCancel: (){  }, 
                                          onConfirm: (){controller.deletCatogeries(controller.data[index].categoriesId!, controller.data[index].categoriesImage!);
                                          Get.back();// delet default dialog
                                          }
                                          );

                                       
                                          }, icon: Icon(Icons.delete_forever_outlined)),
                                          IconButton(onPressed: (){
                                         
                                        controller.goToedite(controller.data[index]);}, 
                                          icon: Icon(Icons.edit_note_outlined)),
                                      ],
                                    ),
                              ))
                        ]),
                      ),
                    ),
                  ),
                )));
  }
}
