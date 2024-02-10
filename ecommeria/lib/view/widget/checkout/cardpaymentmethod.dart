import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CardPaymentmethodcheckout extends StatelessWidget {
  final String texttitle;
final  bool isActive;
  const CardPaymentmethodcheckout({super.key, required this.texttitle, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Container(
            decoration: BoxDecoration(
                color:isActive == true? ColorAPP.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              texttitle,
              style: TextStyle(
                  color:isActive == true? Colors.white :ColorAPP.primaryColor, height: 1, fontWeight: FontWeight.bold),
            ),
          );
  }
}