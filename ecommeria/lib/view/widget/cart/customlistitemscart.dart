import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';

import 'package:cached_network_image/cached_network_image.dart';

class CustomListitemsCart extends GetView<CartController> {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function() onAdd;
  final void Function() onRemove;

  const CustomListitemsCart({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.put(CartController());
    return GetBuilder<CartController>(
      builder: (controller) => Container(
        padding: EdgeInsets.all(2),
        child: Column(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                          height: 180,
                          imageUrl:
                              "http://192.168.1.240/ecommeria/upload/items/$imagename" 
                          //                    imageUrl:
                          // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhsUyh-9Uor5LGq4jlEDxIhaXWN1TGJgLHbwo7j889PkkjRQlbswtHizfzerVPZ6Dd04g&usqp=CAU"
                          //// imagename => final String  imagename;
                          ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                          name,
                          style: TextStyle(fontSize: 17),
                        ),
                        subtitle: Text(
                          price,
                          style: const TextStyle(
                              fontSize: 17, color: ColorAPP.langbutton),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                        Text(
                          count,
                          style: TextStyle(fontFamily: "sms"),
                        ),
                        IconButton(
                            onPressed: onRemove, icon: Icon(Icons.remove)),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
