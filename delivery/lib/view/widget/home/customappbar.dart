import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  // name of function
  final void Function()? onPressedSearch;
  final void Function()? onPressedfavorite;
  final void Function(String) myonChanged;
  final TextEditingController mycontroller;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedSearch,
      required this.onPressedfavorite,
      required this.myonChanged,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          onChanged: myonChanged,
          controller: mycontroller,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  icon: const Icon(Icons.search), onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedfavorite,
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: Colors.grey[600],
              )),
        ),
      ]),
    );
  }
}
