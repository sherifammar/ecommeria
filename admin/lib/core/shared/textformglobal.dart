import 'package:flutter/material.dart';

class CustomTextformglobal extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData? iconData;
  final TextEditingController mycontroller;
 
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapicon;

  const CustomTextformglobal(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obscureText,
      this.onTapicon}); // remove require

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText == null || obscureText == false ? false : true,
maxLines: 2,
      keyboardType: isNumber
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
          
      validator: valid,
      controller: mycontroller,
      decoration: InputDecoration(
          hintText: hinttext, // do not take widget
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior:
              FloatingLabelBehavior.always, // جعل كلمه الايميل فى الاعلى
          contentPadding:
              const EdgeInsets.symmetric(vertical: 3, horizontal: 25),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10), // make margin
              child: Text(labeltext)),
          suffixIcon: InkWell(
            child: Icon(iconData),
            onTap: onTapicon,// appear or disaapear
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
    );
  }
}
