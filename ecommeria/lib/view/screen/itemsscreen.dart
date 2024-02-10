import 'package:ecommeria/controller/favorite_controller.dart';
import 'package:ecommeria/core/class/handingdataview.dart';

import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/items_controller.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/home/customappbar.dart';

import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';
import '../widget/search.dart';
import 'home.dart';


class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   ItemscontrollerImp controller = Get.put(ItemscontrollerImp());
    FavoriteController fav_controller = Get.put(FavoriteController());
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(15),
      child: GetBuilder<ItemscontrollerImp>(
          builder: (controller) => ListView(
                children: [
                CustomAppBar(
                  titleappbar: "Find Product",
               
                  onPressedSearch: () {
                    controller.onSearchitems();
                  },
                  onPressedfavorite: () {
                    Get.toNamed(AppRoutes.myfavorite);
                  },
                  mycontroller: controller.search!,
                  myonChanged: (val) {
                    controller.chechSearch(val);
                  },
                ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ListCategoriesitems(),
                  HandingDataView(
                      // status request will appear at end
                      statusRequest: controller.statusRequest,
                      widget:!controller.isSearch ?
                       GridView.builder(
                          shrinkWrap:true, // avoid error listview with grideview
                          physics:NeverScrollableScrollPhysics(), // avoid error listview with grideview
                          itemCount: controller.data.length,
                          gridDelegate:
                             const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.7), //avoid over pix problem
                          itemBuilder: (context, index) {
                            // ====================================
     
                            fav_controller.isFavorite[controller.data[index]['items_id']]=controller.data[index]['favorite'];// add to map isfavorire

                             // it can connect between favorite page and items page
                            // favorite == 0 or 1
                            
                           // ========================================================
                            return CustomListItems(
                            itemsmodel: ItemsModel.fromJson(controller.data[index]),
                               // data list for addations from response
                            );
                          }): ListitemsSearch(
                            searchItems: controller
                                .listsearchItems, // get data from listsearchitem
                          )
                          )
                ],
              )),
    )
    );
  }
}
