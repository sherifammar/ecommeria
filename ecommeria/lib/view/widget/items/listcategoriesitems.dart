
import 'package:ecommeria/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../../controller/items_controller.dart';
import '../../../data/model/categoriesmodel.dart';

import 'package:ecommeria/core/function/translatedatabase.dart';

class ListCategoriesitems extends GetView<ItemscontrollerImp> {
  const ListCategoriesitems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemscontrollerImp());
    return SizedBox(
      height: 100,
      child: ListView.separated(// make sparate between items
        separatorBuilder: (context, index) => const SizedBox(width: 10),// separat between container 
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,// convert colum to row
        itemBuilder: (context, index) {
          return Categories(// widget ""
            i:index,// i == index from listview
          categoriesModel:CategoriesModel.fromJson(controller.categories[index]),
            // categories is list -- Categories is widget
            //convert data from api (json) to flutter and pass this data to categoriesModel paramter
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemscontrollerImp> {
  final CategoriesModel categoriesModel;

  //  create instance of CategoriesModel == save data in var categoriesModel 

  final  int? i ;
  const Categories( {Key? key,required this.categoriesModel, required this.i }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemscontrollerImp itemcontroller= Get.put(ItemscontrollerImp());
    return InkWell(
      onTap: (){
        controller.changeCat(i!,categoriesModel.categoriesId!); // i => change color , categoriesid to fetch certain items
        itemcontroller.isSearch = false; // stope search

        // press change i (pass from listview of homescreen) 
        //categoriesModel.categoriesId! == id  => another method transfer data "on page"
        // method used change cat in items
      },
      child: Column(
        children: [
          // SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
                color: ColorAPP.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
                "http://192.168.1.240/ecommeria/upload/cats/${categoriesModel.categoriesImage}",// link + name of image
                color: ColorAPP.secoandColor),
          ),
          GetBuilder <ItemscontrollerImp>(builder: (controller) => Container(
            // ==========================================================
            decoration:
            controller.selectedCat == i? BoxDecoration(border: Border(bottom: BorderSide(color: ColorAPP.primaryColor,width: 3))) : null,
            
            //change under line of color of text
            // selectedcat data transfer home controller to items controller
            // ===========================================================
            child: Text(
              "${translateDatabase(categoriesModel.categoriesNameAr,categoriesModel.categoriesNameAr)}", // save data in var categoriesModel  and take categoriesname
              style: const TextStyle(fontSize:10, color: ColorAPP.grey2, fontWeight: FontWeight.bold),
            ),
          ),)
        ],
      ),
    );
  }
}
