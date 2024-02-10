import 'package:cached_network_image/cached_network_image.dart';

import 'package:ecommeria/view/widget/productdetail/price&amount.dart';
import 'package:ecommeria/view/widget/productdetail/subitemslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productdetail_controller.dart';
import '../../../core/constant/color.dart';

class TopproductDetail extends GetView<ProductDetailcontrollerImp> {
  // 
  const TopproductDetail( {super.key});

  @override
  Widget build(BuildContext context) {
    return // using container with listview  make padding for all page

        ListView(children: [
      Stack(
        clipBehavior: Clip.none, // present cut part of image
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: ColorAPP.secoandColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
          ),
          Positioned(
            // image of dress
            top: 7,
            left: Get.width / 4, // withd of screen /4
            right: Get.width / 4,
            child: Hero(
              tag:
                  "${controller.itemsModel.itemsId}", // => itemsModel is instance ItemsModel .. pass from product detaill controller
              child: InkWell(
                onTap: () {
               
                 controller.goToAugment(controller.itemsModel);
                },
                child: CachedNetworkImage(
                    height: 200,
                    fit: BoxFit.fill,
                    imageUrl:
                        "http://192.168.1.4/ecommeria/upload/${controller.itemsModel.itemsImage}"),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${controller.itemsModel.itemsName}",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: ColorAPP.grey2),
            ),
            const SizedBox(
              height: 10,
            ),
            Price_amountproduct(
              count: '${controller.CountitemsIncart}',
              onadd: () {controller.add(); },
              onremove: () {controller.remove();},
              price: '${controller.itemsModel.itempricediscount}',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${controller.itemsModel.itemsDesc}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
             
            
            Text(
              "color",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: ColorAPP.grey2), // copywith main => change color
            ),

            SubitemsList(),
            
            GetBuilder<ProductDetailcontrollerImp>(
              builder: (controller) => Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // controller.addFavorite(controller.itemsModel.itemsId!);

                      print("hiiiisherif");
                    },

                    icon: const Icon(Icons
                        .favorite), // change shape of icon according to click
                    color: ColorAPP.primaryColor,
                  ),
                  IconButton(
                    onPressed: () {
                      // controller.removeFavorite(controller.itemsModel.itemsId!);
                    },

                    icon: const Icon(Icons
                        .favorite_border_outlined), // change shape of icon according to click
                    color: ColorAPP.primaryColor,
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}
