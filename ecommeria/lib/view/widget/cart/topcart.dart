
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class Topcart extends StatelessWidget {
  final String message;
  const Topcart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return 
  Container(
          height: 20,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: ColorAPP.primaryColor,
              borderRadius: BorderRadius.circular(20)),
              child: Text(message,textAlign: TextAlign.center,style: TextStyle(fontSize: 10,color: Colors.white),),
        );}}