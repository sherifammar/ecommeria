import 'dart:ffi';


import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';


class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;// must be add final
  final String textbutton;
  final IconData icondata;
   final bool? active ;
   const CustomButtonAppBar(
      {Key? key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
       required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icondata,
              color: active == true ? ColorAPP.primaryColor :ColorAPP.grey2),
          Text(textbutton,
              style: TextStyle(
                  color: active == true ? ColorAPP.primaryColor :ColorAPP.grey2,fontSize: 10))
        ]),
      ),
    );
  }
}
