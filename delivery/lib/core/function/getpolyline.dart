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
