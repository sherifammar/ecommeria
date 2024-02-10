import 'dart:convert';

import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasourse/remote/auth/signup.dart';
import '../../data/datasourse/remote/test_data.dart';

abstract class Sginupcontroller extends GetxController {
  Sginup();
  gotosignin();
}

class SginupcontrollerImp extends Sginupcontroller {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(
      Get.find()); // binding and get.find => solve problem of constructure crud
  List data = [];

  @override
  gotosignin() {
    Get.offNamed(AppRoutes.login);
  }

  // to save data from response
  @override
  Sginup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading; // for  loading
      update();
      var response = await signupData.postData(
          username.text, password.text, email.text, phone.text);
      // send username fro flutter to php page

      print("**************** $response*********");

      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']); // main if scucess add in reponse in list of data
          Get.offNamed(AppRoutes.verifycode_sginup, arguments: {
            "email": email.text
          }); // send email to verfiycode page
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "phone and email are exist");
          statusRequest = StatusRequest.failure; //error in data
        }
      }

      update();

      // Get.offNamed(AppRoutes.verifycode_sginup);
      // Get.delete<SginupcontrollerImp>();// استخدام البلت هن روت يمكن الاستغناء عن الدليت
      print("valid");
    } else {
      print("non valid");
    }
  }
  // TODO: implement Sginup

// ================ fire base =================
  Future  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
   

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);
 if (FirebaseAuth.instance.currentUser != null) {
  // Get.toNamed(AppRoutes.home);
    authFirebaseSginup(FirebaseAuth.instance.currentUser!.email.toString());
  }
  else{print("empty");
  }
}


  // Future signInWithFacebook(BuildContext context) async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     final OAuthCredential facebookCredential =
  //         FacebookAuthProvider.credential(result.accessToken!.token);
  //     final userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(facebookCredential);
  //     if (FirebaseAuth.instance.currentUser != null) {
  //       // UsersModels userModel=  UsersModels();
  //       // userModel.usersPhone=phone.text;
  //       // userModel.usersEmail=FirebaseAuth.instance.currentUser!.email.toString();
  //       // userModel.usersId= FirebaseAuth.instance.currentUser!.uid.toString();

  //       // userModel.usersName=FirebaseAuth.instance.currentUser!.displayName.toString();
  //       try {
  //         // await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid.toString()).set(userModel.asMap());

  //       authFirebaseSginup(username, String password, FirebaseAuth.instance.currentUser!.email.toString(), String phone)

  //         Get.offAllNamed(AppRoutes.login);
  //         Get.snackbar('Successful', 'User Signed Up Successfully',
  //             duration: const Duration(seconds: 2),
  //             backgroundColor: Colors.green,
  //             snackPosition: SnackPosition.BOTTOM);
  //       } on FirebaseException catch (e) {
  //         print(e.toString());
  //       }
  //     }
  //     if (kDebugMode) {
  //       print('Running TRY block of Facebook sign in ');
  //       print('USER CREDENTIALS FROM FACEBOOK SIGN IN :$userCredential');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: Colors.green,
  //         behavior: SnackBarBehavior.floating,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         duration: const Duration(seconds: 2),
  //         content: Text(
  //           e.message ?? '',
  //           style: const TextStyle(color: Colors.white),
  //         )));
  //     if (kDebugMode) {
  //       print('Running catch block of Facebook sign in ');
  //       print('Problem occurred in Facebook sign in function from Auth class');
  //       print('The problem is: ${e.message}');
  //     }
  //   }
  // }

  // upgrade(String email) async {
  //   // verifycodesignup == verificationCode

  //   statusRequest = StatusRequest.loading; // for  loading
  //   update();
  //   var response = await signupData.fireBaseData(email);

  //   print("**************** $response*********");

  //   statusRequest = handdlingData(
  //       response); // it give statusrequest error or statusrequest sucess

  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       Get.offNamed(AppRoutes.scucess_sginup); // send email to verfiycode page
  //     } else {
  //       Get.defaultDialog(
  //           title: "warning", middleText: "verify code  are error");
  //       statusRequest = StatusRequest.failure; //error in data
  //       // print("shergghjj");
  //     }
  //   }

  //   update();
  // }

  authFirebaseSginup(String email) async {
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await signupData.fireBassignup(
        username.text, password.text, email, phone.text);
    // send username fro flutter to php page

    print("**************** $response*********");

    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']); // main if scucess add in reponse in list of data
        Get.offNamed(AppRoutes.login); // send email to verfiycode page
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "phone and email are exist");
        statusRequest = StatusRequest.failure; //error in data
      }
    }

    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
