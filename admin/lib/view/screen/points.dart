
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import '../../../controller/catogeriescontroller/addcats_controller.dart';

// import '../../../core/class/handingdataview.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/function/validinput.dart';
// import '../../../core/shared/custombutton.dart';
// import '../../../core/shared/dropdownlist.dart';
// import '../../../core/shared/textformglobal.dart';
// import '../../controller/coupon&points_controller.dart';


// class Points extends StatelessWidget {
//   const Points({super.key});

//   @override
//   Widget build(BuildContext context) {
// Get.put(CouponAndPointsController());
//     return Scaffold(
//         appBar: AppBar(
//           title:const Text("Edite Points"),
//         ),
//         body:
        
//          GetBuilder<CouponAndPointsController>(
//           builder: (controller)=>HandingDataView(statusRequest: controller.statusRequest!, widget:  Column(
//             children: [
//                  ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: controller.pointsdata.length,
//                         itemBuilder: (context, index) => Center(
//                               child: Column(
//                                 children: [
//                                  const  SizedBox(height: 10,),
//                                   Text(
//                                       "points score: ${controller.pointsdata[index].pointsScore}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//                                   Text(
//                                       "points discount: ${controller.pointsdata[index].pointsDiscount}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//                                                                         Text(
//                                       "points expire:   ${controller.pointsdata[index].pointsExpiredate}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        
//                                 ],
//                               ),
//                             )),
//               Container(
//                   padding: EdgeInsets.all(30),
//                     child:
//                      Form(
//                       key: controller.formState1,
//                       child: ListView(
//                                  shrinkWrap: true,
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           CustomTextformglobal(
//                             hinttext: 'Add points score',
//                             isNumber: true,
//                             labeltext: 'Add points score',
//                             mycontroller: controller.pointsscore,
//                             valid: (val) {
//                               return validinput(val!, 1, 30, "");
//                             },
//                             iconData: Icons.category,
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
                      
                        
//                           const SizedBox(
//                             height: 20,
//                           ),
//                             CustomTextformglobal(
//                             hinttext: 'Add discount',
//                             isNumber: true,
//                             labeltext: 'Add discount',
//                             mycontroller: controller.pointsdiscount,
//                             valid: (val) {
//                               return validinput(val!, 1, 30, "");
//                             },
//                             iconData: Icons.comment_bank_outlined,
                          
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
                        
//                       ElevatedButton(
//                           onPressed: () async {
//                             DateTime? newDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: controller.dateTime,
//                                 firstDate: DateTime(2000),
//                                 lastDate: DateTime(2100));
//                             if (newDate == null) return;
//                             TimeOfDay? newTime = await  showTimePicker(
//                                 context: context,
//                                 initialTime: TimeOfDay(
//                                     hour: controller.dateTime.hour,
//                                     minute: controller.dateTime.minute));
//                             if (newTime == null) return;
//                             final newDateTime = DateTime(
//                               newDate.year,
//                               newDate.month,
//                               newDate.day,
//                               newTime.hour,
//                               newTime.minute,
//                             );
                         
//                          controller.choosePointsexpiredate(newDateTime.toString());
//                             print(newDateTime.toString());
//                           },
//                           child: const Text("Expire date")),
//                           ElevatedButton(onPressed: (){
//                             controller.editePoints();
//                           }, child:const Text("Edite points")),
                       
                         
                      
//                         ],
//                       ),
//                     ),
//                   ),
//             ],
//           )
//               )
              
//         ));
//   }
// }
