
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/imageasset.dart';
import 'StatusRequest.dart';

class HandingDataView extends StatelessWidget {
  final StatusRequest statusRequest; // error solved => add -->final
  final Widget widget;
  const HandingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(ImageAsset.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child:
                    Lottie.asset(ImageAsset.offline, width: 250, height: 250),
              )
            : statusRequest == StatusRequest.servicefailure
                ? Center(
                    child: Lottie.asset(ImageAsset.service,
                        width: 250, height: 250),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(ImageAsset.notdata,
                            width: 250, height: 250),
                      )
                    : widget;
  }
}
// ==========================================
class HandingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest; // error solved => add -->final
  final Widget widget;
  const HandingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(ImageAsset.loading, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child:
                    Lottie.asset(ImageAsset.offline, width: 250, height: 250),
              )
            : statusRequest == StatusRequest.servicefailure
                ? Center(
                    child: Lottie.asset(ImageAsset.service,
                        width: 250, height: 250),
                  )
                : widget;
  }
}
