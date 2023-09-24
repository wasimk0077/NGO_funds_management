// import 'dart:async';

// import 'package:flutter/material.dart';

// // import 'package:Veots/widgets/ham.dart';


// // import 'home_page.dart';
// import 'login.dart';

// class Coupon_Details extends StatefulWidget {
//   const Coupon_Details({super.key,});
//   // final cashBackPts;
//   @override
//   State<Coupon_Details> createState() => _Coupon_DetailsState();
// }

// class _Coupon_DetailsState extends State<Coupon_Details> {
//        var _scaffoldKey = new GlobalKey<ScaffoldState>();

//   @override 
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer(
//       Duration(seconds: 4,),
//       () { 
        
//           Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(
//                               builder: ((context) => const HomeScreen(
//                                     first_time: 0,mainLink: '',location_on: true,
//                                   ))),
//                           (Route<dynamic> route) => false,
//                         );
//       }
//     );
    
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           key: _scaffoldKey,
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 50,
//             ),
//             Container(
//               // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
//               // margin: EdgeInsets.only(top: 0),
//               // color: Colors.red,
//               child: Row(
//                 children: [
//                   Container(
//                     // color: Colors.yellow,
//                     // alignment: Alignment.bottomRight,
//                     height: MediaQuery.of(context).size.width * 0.08,
//                     width: MediaQuery.of(context).size.width * 0.08,
//                     child: IconButton(
//                         onPressed: () {
//                           // Navigator.of(context).pushAndRemoveUntil(
//                           //   MaterialPageRoute(
//                           //       builder: ((context) => const HomeScreen(
//                           //             first_time: 0,
//                           //           ))),
//                           //   (Route<dynamic> route) => false,
//                           // );
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(
//                           Icons.arrow_back_ios_new,
//                           color: const Color(0xff002060),
//                           size: MediaQuery.of(context).size.width * 0.04,
//                         )),
//                   ),

//                   // SizedBox(
//                   //   width: MediaQuery.of(context).size.width/15,
//                   // ),

//                   Container(
//                     // color: Colors.red,
//                     child: Image.asset(
//                       'assets/veots_logo_wo_tl.png',
//                       height: MediaQuery.of(context).size.width * 0.08,
//                       width: MediaQuery.of(context).size.width * 0.15,
//                     ),
//                   ),
//                   const Spacer(),
//                   // SizedBox(
//                   //   width: MediaQuery.of(context).size.width * 0.45,
//                   // ),
//                   Container(
//                       height: MediaQuery.of(context).size.width * 0.08,
//                       width: MediaQuery.of(context).size.width * 0.08,
//                       decoration: const BoxDecoration(
//                         color: Color(0xff002060),
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                       ),
//                       child: Center(
//                         child: FittedBox(
//                             child: IconButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: 
//                                    (context)=>HomeScreen(first_time: 0,
//                                    mainLink: '',location_on: true,)), (route) => false);
//                                 },
//                                 icon: const Icon(
//                                   Icons.home,
//                                   // size: MediaQuery.of(context).size.width * 0.06,
//                                   color: Colors.white,
//                                 ))),
//                       )),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.015,
//                   ),
//                   Container(
//                           height: MediaQuery.of(context).size.width * 0.08,
//                           width: MediaQuery.of(context).size.width * 0.08,
//                           decoration: const BoxDecoration(
//                             color: Color(0xff002060),
//                             borderRadius: BorderRadius.all(Radius.circular(5)),
//                           ),
//                           child: Center(
//                             child: FittedBox(
//                               child: 
//                               InkWell(
//                              onTap: (){
//                         _scaffoldKey.currentState?.openDrawer();    },
//                                child: Icon(
//                                   Icons.menu,
//                                   size: MediaQuery.of(context).size.width * 0.05,
//                                   color: Colors.white,
//                                 ),   
//         ),
//                             ),
//                           )),
//                   const SizedBox(
//                     width: 12,
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 10,
//             ),
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     // height: MediaQuery.of(context).size.height* 0.0,
//                     // color: Colors.blue,
//                     margin: EdgeInsets.only(
//                         right: MediaQuery.of(context).size.width * 0.1,
//                         left: MediaQuery.of(context).size.width * 0.1),

//                     child: Text(
//                       "All purchases",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "Poppins Medium",
//                         color: Colors.black,
//                         // fontStyle: FontStyle.italic,
//                         fontSize: MediaQuery.of(context).size.width * 0.07,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(
//                         right: MediaQuery.of(context).size.width * 0.1,
//                         left: MediaQuery.of(context).size.width * 0.1),

//                     //  color: Colors.blue,

//                     child: Text(
//                       "We are glad to see you back.",
//                       style: TextStyle(
//                         // fontWeight: FontWeight.bold,
//                         fontFamily: "Poppins Medium",
//                         color: Colors.black,
//                         // fontStyle: FontStyle.italic,
//                         fontSize: MediaQuery.of(context).size.width * 0.04,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
            
//           ],
//         ),
//       ),
//        drawer:  HamWidget()
//     )
//     );
//   }
// }
