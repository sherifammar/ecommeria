
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constant/color.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textOfButton;// add name of text of button
  final void Function() onPressed; // add name of function
  const CustomButtonLanguage(
      {super.key, required this.textOfButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: MaterialButton(
        color: ColorAPP.langbutton,
        textColor: ColorAPP.background,
        onPressed: onPressed,// add as parameter
        child: Text(
          textOfButton,// add as parameter
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
