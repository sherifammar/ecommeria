
import 'package:ecommeria/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ecommeria/core/function/translatedatabase.dart';
import '../../../controller/home_controller.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../data/model/categoriesmodel.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: 
      ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),// separat between container 
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,// convert colum to row
        itemBuilder: (context, index) {
          return Categories(// widget 
              i:index,// i == index from listview
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),// categories is list -- Categories is widget ... convert data from api (json) to flutter and pass this data to   categoriesModel paramter
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;// save data in var categoriesModel 
  final  int? i ;
  const Categories( {Key? key,required this.categoriesModel, required this.i }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){controller.goToitems(controller.categories, i!,categoriesModel.categoriesId!);},
      //id == catogriesid ==categoriesModel.categoriesId! , i == select cat , categories is list filled by request
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorAPP.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child:
             SvgPicture.network(
                "http://192.168.1.240/ecommeria/upload/cats/${categoriesModel.categoriesImage}",// link + name of image
                color: ColorAPP.secoandColor),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesNameAr,categoriesModel.categoriesName)}", // save data in var categoriesModel  and take categoriesname
            style: const TextStyle(fontSize: 13, color: ColorAPP.black),
          )
        ],
      ),
    );
  }
}
