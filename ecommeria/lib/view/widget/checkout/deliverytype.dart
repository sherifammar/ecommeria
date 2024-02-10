import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class DeliveryType extends StatelessWidget {
  final String texttitle;
  final String nameImage;
  final bool isActive;
  const DeliveryType(
      {super.key,
      required this.texttitle,
      required this.nameImage,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 120,
        decoration: BoxDecoration(
            color: isActive == true ? ColorAPP.primaryColor : Colors.white,
            border: Border.all(color: ColorAPP.primaryColor, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              nameImage,
              width: 90,
              // color: Colors.white,
            ),
            Text(
              texttitle,
              style:
                  const TextStyle(color: ColorAPP.primaryColor, fontSize: 15),
            )
          ],
        ));
  }
}
