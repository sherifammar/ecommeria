import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommeria/data/model/itemsmodel.dart';

import 'package:flutter/material.dart';
import 'package:ecommeria/core/function/translatedatabase.dart';
import 'package:get/get.dart';

import '../../../controller/gotoproductdetailfromfavoritecontroller.dart';
import '../../../controller/myfavoriteview_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/myfavoritemodel.dart';

class CustomListFavorite extends GetView<MyFavoriteViewController> {
  final MyFavoriteModel favoritemodel; // create stance from favoritemodel

  const CustomListFavorite({
    super.key,
    required this.favoritemodel,
    r
  });

  @override
  Widget build(BuildContext context) {
    MyFavoriteViewController controller = Get.put(MyFavoriteViewController());

    return InkWell(
      onTap: () {
        controller.isSearch=true;
        controller.searchMyfavorite('${favoritemodel.itemsName}'
        );

       // =========================================
          // GoToproductdetail productdetailcontroller =
          //     Get.put(GoToproductdetail());
          // productdetailcontroller
          //     .favoritetoProductdetail(favoritemodel.itemsId!);

          // productdetailcontroller.goToproductdetailfromfavorite(
          //     ItemsModel.fromJson(productdetailcontroller.itemsdata[0]));
          // productdetailcontroller.itemsdata.clear();
         
        
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Hero(
                  tag: "${favoritemodel.itemsId}",
                  child: CachedNetworkImage(
                      height: 250,
                      fit: BoxFit.fill,
                      imageUrl:
                          "http://192.168.1.240/ecommeria/upload/${favoritemodel.itemsImage}"),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "${translateDatabase(favoritemodel.itemsNameAr, favoritemodel.itemsName)}", //== favoritemodel.itemsName!
                style: const TextStyle(
                    color: ColorAPP.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),

              Text(favoritemodel.itemsDesc!, // ${itemmodels.itemdesc}
                  textAlign: TextAlign
                      .center,maxLines: 2,), // make text in center, error =>not using style
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "rating",
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        ...List.generate(
                            3,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // make space between it
                children: [
                  Text(
                    "${favoritemodel.itempricediscount}",
                    style: const TextStyle(
                        color: ColorAPP.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.deletFromfavorite(favoritemodel.favoriteId!);
                      },
                      icon: Icon(Icons.delete_forever_outlined))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
