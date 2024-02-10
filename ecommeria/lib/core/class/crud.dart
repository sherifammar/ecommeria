import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../function/checkinternet.dart';
import 'StatusRequest.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    // try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);

        print(' crude == > ${response.statusCode }'); 
        // print 200
        if (response.statusCode == 200 || response.statusCode == 201) {

            Map responsebody = jsonDecode(response.body);
            
          print(responsebody);
          return Right(responsebody); // right == map data
        } else {
          return const Left(StatusRequest.servicefailure);
        }
      } else {
        return const Left(
            StatusRequest.offlinefailure); // left == statusrequest
      }
    // } catch (_) {
    //   return Left(StatusRequest.serverexcepation);
    // }
  }
}
