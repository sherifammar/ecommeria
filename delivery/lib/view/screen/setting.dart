
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/setting_controller.dart';
import '../../core/constant/apptheme.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/services/servives.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: Get.width / 3, color: ColorAPP.primaryColor),
                Positioned(
                    top: Get.width / 4.5,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: AssetImage(ImageAsset.avatar),
                      ),
                    )),
              ]),
          SizedBox(height: 55),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  onTap: () {},
                  title: Text("Disable notification"),
                  trailing: Switch(
                      value: true,
                      onChanged: (value) {
                        // Myservices myservices = Get.find();
                        // String userid =
                        //     myservices.sharedPreferences.getString("id")!;
                        // FirebaseMessaging.instance
                        //     .unsubscribeFromTopic('users${userid}');

                        
                // if (Get.isDarkMode) {
                  
                //   Get.changeTheme(themeEnglish.light());
                // } else {
                //   Get.changeTheme(themeEnglish.dark());
                // }
              
                      }
                      ),
                ),
             
                
                SizedBox(
                  height: 5,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.Archivedelivery);
                  },
                  title: Text("Archive"),
                  trailing: Icon(Icons.save_as_rounded),
                ),
            
                SizedBox(
                  height: 5,
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  title: Text("About us"),
                  trailing: Icon(Icons.help_outline_rounded),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:+201062575511"));
                  },
                  title: Text("Conact us"),
                  trailing: Icon(Icons.phone_callback_outlined),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    ); // can not use scafold +> using container is part of page
  }
}
