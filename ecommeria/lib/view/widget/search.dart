import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controller/home_controller.dart';
import '../../data/model/itemsmodel.dart';

class ListitemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> searchItems;

  const ListitemsSearch({
    super.key,
    required this.searchItems,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchItems.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToproductdetail(
                searchItems[index]); // go to one certain item
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                        height: 180,
                        imageUrl:
                            "http://192.168.1.4/ecommeria/upload/${searchItems[index].itemsImage}" // imagename => final String  imagename;
                        ),
                  ),
                  Expanded(
                      flex: 2,
                      child: ListTile(
                          title: Text('${searchItems[index].itemsName}'),
                          subtitle:
                              Text('${searchItems[index].categoriesName}'),
                              trailing: Text('${searchItems[index].itempricediscount}'),)
                              ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
