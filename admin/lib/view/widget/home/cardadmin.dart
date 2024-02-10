import 'package:flutter/material.dart';
class Cardadmin extends StatelessWidget {
  final String texttitle;
  final String imageasset;
  final void Function()? onpress;
  const Cardadmin({super.key, required this.texttitle, required this.imageasset, this.onpress});

  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: onpress,
      child: Card(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageasset,width: 90,),
        Text(texttitle),
        
      ],
      ),),
    );
  }
}