import 'package:ecommeria/core/function/checkinternet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  intialdata() async{// check on internet
res = await checkInternet();
 print( res);
  }

  @override
  void initState() {
    intialdata() ;
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("testing package")),body: ListView(children: [
      
    ]),);
  }
}