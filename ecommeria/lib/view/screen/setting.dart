import 'package:ecommeria/controller/setting_controller.dart';
import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/apptheme.dart';
import '../../core/constant/imageasset.dart';
import '../../core/services/servives.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return 
    GetBuilder<SettingController>(builder: (controller) =>    Container(
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
                            title: const Text("Notification"),
                            trailing: 
                            Switch(
                                value: controller.isSwitchnotification,
                                activeColor: Colors.red,
                                onChanged: (value) {
                                  controller.checkNotification(value);
                                })),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.orderspending);
                  },
                  title: Text("Orders"),
                  trailing: Icon(Icons.card_travel_sharp),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.archive);
                  },
                  title: Text("Archive"),
                  trailing: Icon(Icons.save_as_rounded),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.addressview);
                  },
                  title: Text("Address"),
                  trailing: Icon(Icons.location_on_outlined),
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
    ));
 // can not use scafold +> using container is part of page
  }
}
