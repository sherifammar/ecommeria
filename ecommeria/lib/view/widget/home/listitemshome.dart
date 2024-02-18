import 'package:ecommeria/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommeria/core/function/translatedatabase.dart';
import '../../../controller/home_controller.dart';
import '../../../data/model/itemsmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal, // to scroll as row
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[
                    i])); // item is list from controller .. itemsmodel is var used to save data
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToproductdetail(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CachedNetworkImage(
              height: 100,

              imageUrl:


                  "http://192.168.1.240/ecommeria/upload/items/${itemsModel.itemsImage}",
             
              width: 150,
              fit: BoxFit.fill,
            ),

            //   imageUrl:
            // "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fcamera-png&psig=AOvVaw2-JYbZPWDKUYczEVgm6DvT&ust=1706128156523000&source=images&cd=vfe&ved=0CBIQjRxqFwoTCLD6lOes9IMDFQAAAAAdAAAAABAE"),
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorAPP.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            height: 120,
            width: 200,
          ),
          Positioned(
              left: 10,
              child: Text(
                "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                style: const TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 14),
              ))
        ],
      ),
    );
  }
}
