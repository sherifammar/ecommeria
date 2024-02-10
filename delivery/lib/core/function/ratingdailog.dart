

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';

import '../../data/datasourse/remote/orders/orderspending_data.dart';
import '../constant/color.dart';
import '../constant/imageasset.dart';

final _dialog = RatingDialog(
  
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(ImageAsset.logonsignin),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(color: ColorAPP.primaryColor),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
   
        print('rating: ${response.rating}, comment: ${response.comment}');
      
      },
    );
void showRating(BuildContext context){
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );



}