import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Price_amountproduct extends StatelessWidget {
  final void Function()? onadd;
  final void Function()? onremove;
  final String count;
  final String price;
  const Price_amountproduct(
      {super.key,
      required this.onadd,
      required this.onremove,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onadd, icon: const Icon(Icons.add)),
            Container(
                alignment: Alignment.center,
                width: 30,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorAPP.black),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(count)),
            IconButton(onPressed: onremove, icon: const Icon(Icons.remove))
          ],
        ),
        const Spacer(), // space between row and text
        Text(
          "$price\$", //  connectorerror => \
          style: const TextStyle(
              color: ColorAPP.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
