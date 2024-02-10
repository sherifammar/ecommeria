import 'package:ecommeria/controller/address/addressview_controller.dart';
import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/addressmodel.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressViewcontroller addressviewcontroller =
        Get.put(AddressViewcontroller());

    return Scaffold(
        appBar: AppBar(
          title: const Text('address'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.addaddress);
            },
            child: Icon(Icons.add)),
        body: GetBuilder<AddressViewcontroller>(
          builder: (controller) => HandingDataView(
            statusRequest: addressviewcontroller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: addressviewcontroller.data.length,
                itemBuilder: (context, i) {
                  return Dismissible(
                      key: UniqueKey(),
                      // direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {
                        addressviewcontroller
                            .deleteAddress(controller.data[i].addressId!);
                      },
                      child: CardAddress(
                          addressModel: addressviewcontroller.data[
                              i], // add list data in   final AddressModel addressModel
                          // onDelete: () {
                          //   addressviewcontroller
                          //       .deleteAddress(controller.data[i].addressId!);

                          // },
                          onTap: () {
                            addressviewcontroller
                                .gotoediteAddress(controller.data[i]);
                          }));
                },
              ),
            ),
          ),
        ));
  }
}

class CardAddress extends GetView<AddressViewcontroller> {
  final AddressModel addressModel;
  final void Function()? onDelete;
  final void Function()? onTap;
  const CardAddress(
      {Key? key, required this.addressModel, this.onDelete, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressViewcontroller addressviewcontroller =
        Get.put(AddressViewcontroller());
    return Container(
      // padding: EdgeInsets.all(10),
      child: ListTile(
          title: Text(addressModel.addressName!),
          subtitle: Text(
              "${addressModel.addressCity!} * * ${addressModel.addressStreet}"),
          trailing: IconButton(
              // onPressed:onTap,
              onPressed: onTap,
              //  onDelete,
              icon: const Icon(Icons.edit))),
    );
  }
}

