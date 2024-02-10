import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommeria/data/model/itemsmodel.dart';

import 'package:flutter/material.dart';
import 'package:ecommeria/core/function/translatedatabase.dart';
import 'package:get/get.dart';

import '../../../controller/allratingdetailscontroller.dart';

import '../../../core/constant/color.dart';

import '../../../data/model/ratingitems/allratingitemsviewmodel.dart';

class CustomRatingitemsdetail extends GetView<AllratingDetailController> {
  final AllratingitemsviewModel allRatingitemsmodel; // create stance from favoritemodel

  const CustomRatingitemsdetail( {
    super.key,
    required this.allRatingitemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    AllratingDetailController controller= Get.put(AllratingDetailController());
     
    return Center(
      child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             
                Text(
                  "${allRatingitemsmodel.ratingitemsUsersname}", //== favoritemodel.itemsName!
                  style: const TextStyle(
                      color: ColorAPP.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
    
                Text(allRatingitemsmodel.ratingitemsComment, // ${itemmodels.itemdesc}
                    textAlign: TextAlign
                        .center), // make text in center, error =>not using style
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
                           int.parse(allRatingitemsmodel.ratingitemsRate)  ,
                              (index) => const Icon(
                                    Icons.star,
                                    size: 15,
                                  )
                                  )
                        ],
                      )
                    ],
                  ),
                ),
          
              ],
            ),
          ),
        ),
    );

    
  }

  
}
