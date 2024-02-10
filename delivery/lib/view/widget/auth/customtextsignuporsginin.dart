import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constant/color.dart';
class CustomTextSginuporsignin extends StatelessWidget {
  final String textone;
  final String texttwo;
   final void Function() onTap;

  const CustomTextSginuporsignin({super.key, required this.textone, required this.texttwo,  required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(textone),
              InkWell(
                onTap: onTap,
                child: Text(texttwo,
                    style: TextStyle(
                        color: ColorAPP.primaryColor,
                        fontWeight: FontWeight.bold)),
              )
            ],
          );
  }
}