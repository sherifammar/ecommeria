import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../controller/auth/sginup_controller.dart';
import '../../../core/constant/imageasset.dart';
import '../../screen/auth/login.dart';



class Facebookgoolewidget extends StatelessWidget {
  const Facebookgoolewidget ({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    SginupcontrollerImp controller = Get.put(SginupcontrollerImp());
    return GetBuilder<SginupcontrollerImp>(builder: (controller) => Expanded(
           
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                 
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(

                      children: [
                       
                        
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Sign In with social media',style: TextStyle(fontSize: 18),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                controller.signInWithGoogle();
                              },
                              child: Container(
                                  height: 50,
                                  child: Image.asset('${ImageAsset.google}')
                                  ),
                            ),
                            // InkWell(
                            //   onTap: (){
                            //    controller.signInWithFacebook(context);
                            //   },
                            //   child: const Icon(
                            //     Icons.facebook_outlined,
                            //     size: 32,),
                            // ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ",style: TextStyle(fontSize: 14),),
                              InkWell(onTap:(){
                                Get.to(()=>Login());
                              },child: Text("Login now!!",style: TextStyle(fontSize: 14,color: Get.isDarkMode?Colors.purpleAccent:Colors.deepPurpleAccent,fontWeight: FontWeight.bold),)),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ))) ;
          
  }
}
