import 'package:flutter/material.dart';

class Searchappbar extends StatelessWidget {
  final String titleappbar;

  final TextEditingController mycontroller1;

  final TextEditingController mycontroller2;

  const Searchappbar(
      {super.key, 
      required this.titleappbar,
     
      required this.mycontroller1,
      
      required this.mycontroller2})
      ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
     
          controller: mycontroller1,
          decoration: InputDecoration(
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextFormField(
         
          controller: mycontroller2,
          decoration: InputDecoration(
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
      ]),
    );
  }
}
