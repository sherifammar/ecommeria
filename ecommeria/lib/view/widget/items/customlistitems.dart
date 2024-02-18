import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommeria/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommeria/core/function/translatedatabase.dart';
import 'package:get/get.dart';
import '../../../controller/items_controller.dart';
import '../../../controller/ratingitemscontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../data/model/itemsmodel.dart';


class CustomListItems extends GetView<ItemscontrollerImp> {
  final ItemsModel itemsmodel; // create stance from ItemsModel

  const CustomListItems({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    ratingItemsController ratingitemscontroller =
        Get.put(ratingItemsController());
     
    return InkWell(
      onTap: () {
        controller.goToproductdetail(
            itemsmodel); // send itemsmodel is instace of ItemsModel
      },
      child: Card(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Hero(
                    tag: "${itemsmodel.itemsId}",
                    child: 
                    CachedNetworkImage(
                        height: 250,
                        fit: BoxFit.fill,
                        imageUrl:
                            "http://192.168.1.240/ecommeria/upload/items/${itemsmodel.itemsImage}"),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "${translateDatabase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}", //== itemsmodel.itemsName!
                  style: const TextStyle(
                      color: ColorAPP.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),

                Text(itemsmodel.itemsDesc!, // ${itemmodels.itemdesc}
                    textAlign: TextAlign.center),
                Text('Delivery time : ${controller.timearrive}',
                    //  'Delivery time : ${controller. myservices.sharedPreferences.getString('timeofdelivery')}',
                    // it com from homecontroller
                    textAlign: TextAlign
                        .center), // make text in center, error =>not using style
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ),
                      InkWell(
                         onTap: () {
                            ratingitemscontroller.showRating(
                                context, itemsmodel.itemsId!);
                          },
                        child: const Text(
                          "rating",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Expanded(
                         
                         
                            child: Row(
                              children: [
                               ...List.generate(
                            //  int.parse(itemsmodel.stars!.replaceAll(RegExp(r'[^0-9]'),'')).round() ,
                            // int.parse(itemsmodel.stars!) .round() as int ,
                            3,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    )
                                    )
                              ],
                            ),
                          ),
                        
                      
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround, // make space between it
                    children: [
                      Text(
                        "${itemsmodel.itempricediscount}",
                        style: const TextStyle(
                            color: ColorAPP.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            ratingitemscontroller
                                .goToratingdetail(itemsmodel.itemsId!);
                          },
                          icon: Icon(Icons.comment_bank)),

                      // / ==============================
                      // /
                      GetBuilder<FavoriteController>(
                        // connect to FavoriteController
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsmodel.itemsId] ==
                                "1") {
                              // 1 or 0 mean favorite
                              controller.removeFavorite(itemsmodel
                                  .itemsId!); //rror solved ! and userid =>from myservice
                              controller.setFavorite(itemsmodel.itemsId, "0");
                            } else {
                              controller.setFavorite(itemsmodel.itemsId, "1");
                              controller.addFavorite(itemsmodel.itemsId!);
                            }

                            print("hiiiisherif");
                          },

                          icon: Icon(controller
                                      .isFavorite[itemsmodel.itemsId] ==
                                  "1" // key of map(itemsid)== val of map("1")
                              ? Icons.favorite
                              : Icons
                                  .favorite_border_outlined), // change shape of icon according to click
                          color: ColorAPP.primaryColor,
                        ),
                        // =====================================================
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ignore: unrelated_type_equality_checks
          if (itemsmodel.itemsDiscount != "0")
            Positioned(
              top: 5,
              child: Stack(children: [
                Positioned.fill(
                    top: 50,
                    child: Text(
                      "${itemsmodel.itemsDiscount}",
                      style: TextStyle(fontSize: 20),
                    )),
                Image.asset(ImageAsset.avatar)
              ]),
              width: 20,
            )
        ]),
      ),
    );
  }
}
