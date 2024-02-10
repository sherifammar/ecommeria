import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class CustomButtom extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtom({super.key, required this.text,   required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin:const EdgeInsets.only(top: 10 , right: 20,left: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: ColorAPP.primaryColor,
        textColor: Colors.black,
        child: Text(text , style:const TextStyle(fontWeight: FontWeight.bold , fontSize: 14)),
      ),
    );
  }
}