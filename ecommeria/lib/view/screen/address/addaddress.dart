import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/addaddress_controller.dart';



class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddController addController = Get.put(AddController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Add New Address"),
      ),
      body: GetBuilder<AddController>(
          builder: (addcontroller) => HandingDataView(
                statusRequest: addController.statusRequest,
                widget: Stack(alignment: Alignment.center, children: [
                  if (addcontroller.kGooglePlex != null)
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: addController.makers.toSet(),
                        onTap: (latlng) {
                          addController.addMarker(latlng);
                        },
                        initialCameraPosition: addController.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          addController.completecontroller
                              .complete(controllermap);
                        },
                      ),
                    ),
                  Positioned(
                      bottom: 10,
                      child: MaterialButton(
                          minWidth: 200, // make width
                          onPressed: () {addController.gotoDetailladdress();},
                          child: Text("Add more detail",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          color: ColorAPP.primaryColor,// color of bottom
                          textColor: Colors.white,// color of text
                          )
                          )
                ]),
              )),
                bottomNavigationBar: GetBuilder<AddController>(builder: (controller) => Container(
          height: 40,
          color: ColorAPP.secoandColor,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              
              addController.gotoDetailladdress();},
            child: const Text("Go to  detail address"),
          ),) 
        ),
    );
  }
}
