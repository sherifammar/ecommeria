import 'package:flutter/material.dart';

import '../../data/model/usersadminmodel.dart';

class CustomCard extends StatelessWidget {
  final String nameusers;
  final String id;
    final String countOforders;
  const CustomCard(
      {super.key,
      required this.nameusers,
      required this.id,
      required this.countOforders});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text("user name : ${nameusers}"),
          Text("Id : ${id}"),
          Text("Count of order : ${countOforders}"),
        ],
      ),
    );
  }
}


