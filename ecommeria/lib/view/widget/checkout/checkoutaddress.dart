import 'package:ecommeria/core/constant/color.dart';
import 'package:flutter/material.dart';
class CheckoutAddress extends StatelessWidget {
  final String texttitle;
  final String subtitletext;
  final bool isActive;
  const CheckoutAddress({super.key, required this.texttitle,required this.subtitletext, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive==true?ColorAPP.primaryColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                title: Text(texttitle,style: TextStyle(color: isActive == true ?Colors.red : Colors.black),),
                subtitle: Text(subtitletext,style: TextStyle(color: isActive == true ?Colors.red : Colors.black),),
              ));
  }
}