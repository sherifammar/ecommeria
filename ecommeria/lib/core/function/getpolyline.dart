import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:http/http.dart" as http;

Future getpolylinemap(devlat, devlong, custlat, custlong) async {
  Set<Polyline> polylineset = {};
List<LatLng> PolylineCon = [];
PolylinePoints polylinepoints = PolylinePoints(); // MAKE POINT TO DRAW LINE
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$devlat,$devlong&destination=$custlat,$custlong&key=Apikey";
  var reponse = await http.post(Uri.parse(url));
  var responsebody = jsonDecode(reponse.body); // convert map
  var point = responsebody["routes"][0]["overview_polyline"]
      ["points"]; // fetch points in  map
  List<PointLatLng> result = polylinepoints.decodePolyline(point);
  print(result);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      PolylineCon.add(LatLng(pointLatLng.latitude, pointLatLng.longitude)); // add point in list
    });
  }
  Polyline polyline = Polyline(polylineId: PolylineId("sherif"),color: Colors.blue,width: 5,points: PolylineCon);
 polylineset.add(polyline);
 return polylineset;
}
//========تعدل لنسخه وائل ابو حمزه 
// Future<Set<Polyline>> getpolylinemap(
//     double devlat, double devlong, double custlat, double custlong) async {

//   Set<Polyline> polylineset = {};
//   List<LatLng> polylineCon = [];

//   PolylinePoints polylinepoints = PolylinePoints();

//   String url =
//       "https://maps.googleapis.com/maps/api/directions/json?origin=$devlat,$devlong&destination=$custlat,$custlong&key=YOUR_API_KEY";

//   var response = await http.get(Uri.parse(url));

//   if (response.statusCode == 200) {
//     var responsebody = jsonDecode(response.body);

//     if (responsebody["routes"].isNotEmpty) {
//       var point = responsebody["routes"][0]["overview_polyline"]["points"];

//       List<PointLatLng> result =
//           polylinepoints.decodePolyline(point);

//       for (var p in result) {
//         polylineCon.add(LatLng(p.latitude, p.longitude));
//       }

//       polylineset.add(
//         Polyline(
//           polylineId: const PolylineId("route"),
//           color: Colors.blue,
//           width: 5,
//           points: polylineCon,
//         ),
//       );
//     }
//   }

//   return polylineset;
// }


//========================النسخه الجديده من flutter polyline points 3.1.0 **** سوف تلغى في المستقبل
//==== for new version of flutter polyline points 3.1.0
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// Future getpolylinemap(devlat, devlong, custlat, custlong) async {
// // Initialize PolylinePoints
//   PolylinePoints polylinePoints = PolylinePoints(apiKey: "YOUR_API_KEY");
//   Set<Polyline> polylineset = {};

// // Get route using legacy Directions API
//   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//     request: PolylineRequest(
//       origin: PointLatLng(custlat, custlong), // San Francisco
//       destination: PointLatLng(devlat, devlong), // San Jose
//       mode: TravelMode.driving,
//     ),
//   );

//   if (result.points.isNotEmpty) {
//     // Convert to LatLng for Google Maps
//     List<LatLng> polylineCoordinates = result.points
//         .map((point) => LatLng(point.latitude, point.longitude))
//         .toList();
//     PolylineId id = const PolylineId("sherif");
//     Polyline polyline = Polyline(
//         polylineId: id,
//         color: Colors.blue,
//         points: polylineCoordinates,
//         width: 5);
//     polylineset.add(polyline); // 
//     return polylineset;
//   }
// }
//===================== الاحداث  سوف 2026
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/material.dart';

// Future<Set<Polyline>> getpolylinemap(
//     double devlat, double devlong, double custlat, double custlong) async {

//   PolylinePoints polylinePoints =
//       PolylinePoints(apiKey: "YOUR_API_KEY");

//   Set<Polyline> polylineset = {};

//   // إنشاء request باستخدام Routes API
//   RoutesApiRequest request = RoutesApiRequest(
//     origin: PointLatLng(devlat, devlong),
//     destination: PointLatLng(custlat, custlong),
//     travelMode: TravelMode.driving,
//     routingPreference: RoutingPreference.trafficAware,
//   );

//   // استدعاء API الجديد
//   RoutesApiResponse response =
//       await polylinePoints.getRouteBetweenCoordinatesV2(
//     request: request,
//   );

//   if (response.routes.isNotEmpty) {
//     Route route = response.routes.first;

//     // معلومات إضافية (اختياري)
//     print('Duration: ${route.durationMinutes} minutes');
//     print('Distance: ${route.distanceKm} km');

//     // تحويل النقاط إلى LatLng
//     List<LatLng> polylineCoordinates =
//         (route.polylinePoints ?? [])
//             .map((point) => LatLng(point.latitude, point.longitude))
//             .toList();

//     // إنشاء Polyline
//     Polyline polyline = Polyline(
//       polylineId: const PolylineId("route"),
//       color: Colors.blue,
//       width: 5,
//       points: polylineCoordinates,
//     );

//     polylineset.add(polyline);
//   } else {
//     print("No routes found");
//   }

//   return polylineset;
// }


//===== تعديل **claude ******  getpolyline to new version of flutter polyline points 3.1.0 التى سوف تستخدم في المستقبل

// Future<Set<Polyline>> getPolylineMap(
//     double devlat, double devlong, double custlat, double custlong) async {
//   PolylinePoints polylinePoints = PolylinePoints(apiKey: AppConfig.googleMapsKey);
//   Set<Polyline> polylineSet = {};

//   try {
//     RoutesApiRequest request = RoutesApiRequest(
//       origin: PointLatLng(devlat, devlong),
//       destination: PointLatLng(custlat, custlong),
//       travelMode: TravelMode.driving,
//       routingPreference: RoutingPreference.trafficAware,
//     );

//     RoutesApiResponse response = await polylinePoints
//         .getRouteBetweenCoordinatesV2(request: request);

//     if (response.routes.isNotEmpty) {
//       Route route = response.routes.first;

//       debugPrint('Duration: ${route.durationMinutes} min | Distance: ${route.distanceKm} km');

//       List<LatLng> polylineCoordinates = (route.polylinePoints ?? [])
//           .map((point) => LatLng(point.latitude, point.longitude))
//           .toList();

//       polylineSet.add(Polyline(
//         polylineId: PolylineId("route_${DateTime.now().millisecondsSinceEpoch}"),
//         color: Colors.blue,
//         width: 5,
//         points: polylineCoordinates,
//       ));
//     } else {
//       debugPrint("No routes found");
//     }
//   } catch (e) {
//     debugPrint("Error fetching polyline: $e");
//   }

//   return polylineSet;
// }