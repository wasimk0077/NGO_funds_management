
import 'dart:math';

import 'package:beta_app/ui/AddNGOImages.dart';
import 'package:beta_app/ui/HomeView.dart';
import 'package:beta_app/ui/NgoList.dart';
import 'package:beta_app/ui/login.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:clipboard/clipboard.dart';
import '../net/dataobjects.dart';
import '../net/flutterfire.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

// import 'package:mjor_app/Verification.dart';
// import 'package:uuid/uuid.dart';
// import 'package:veots_mobile_app/screens/Verification_with_phone.dart';
// import 'package:veots_mobile_app/screens/login.dart';

// import '../widgets/Requests.dart';



class Transaction_History_Filter5 extends StatefulWidget {
  Transaction_History_Filter5({super.key,required this.UserAdress });
  final String UserAdress;

  @override
  State<Transaction_History_Filter5> createState() => Transaction_History_Filter5State();
}

class Transaction_History_Filter5State extends State<Transaction_History_Filter5> {
    Map<int, String> months = {
    01: "Jan",
    02: "Feb",
    03: "Mar",
    04: "Apr",
    05: "May",
    06: "Jun",
    07: "Jul",
    08: "Aug",
    09: "Sept",
    10: "Oct",
    11: "Nov",
    12: "Dec"
  };
    Map<int, String> days = {
    01: "Mon",
    02: "Tue",
    03: "Wed",
    04: "Thu",
    05: "Fri",
    06: "Sat",
    07: "Sun",
   
  };

  TextEditingController _NGOName = TextEditingController();
  TextEditingController _Phone_Number = TextEditingController();
  TextEditingController _District = TextEditingController();
  TextEditingController _State = TextEditingController();

  TextEditingController _Password = TextEditingController();
  TextEditingController _Confirm_Password = TextEditingController();
  String? dropdownvalue = null;
  bool loading=true;

  final _ValidationKey = GlobalKey<FormState>();
  List<String> items = ["Community-based", "City-based", "National","International"];
  // Albumotpsend? token;

  bool visible = true;
  bool visible2 = true;


  String? PrivateKey;
  var Address;
 String generateRandomHex() {
  final random = Random();
  final hexDigits = '0123456789abcdef';
  String result = '';

  for (int i = 0; i < 32; i++) {
    final index = random.nextInt(hexDigits.length);
    result += hexDigits[index];
  }
print(result);
  return result;
}

create_identification()async {
 PrivateKey = generateRandomHex();
print("user private key");
print(PrivateKey);
Credentials fromHex = EthPrivateKey.fromHex(PrivateKey!);
Address = await fromHex.extractAddress();
print("wallet address");
print(Address);
}


List<NGOLIST> Ngolist=[];

getData() async {

  await FirebaseFirestore.instance.collection("Transactions").get().then((value) {
    for(var i in value.docs) {
      NGOLIST temp_class = new NGOLIST();
     if(widget.UserAdress==i["NGO_Transactions"]["User_Address"])
     {
       temp_class.details["NGOName"]=i["NGO_Transactions"]["NGO_Name"];
      temp_class.details["NGOImage"]=i["NGO_Transactions"]["NGO_Image"];
      // temp_class.details["NGOEmail"]=i.data()["NGO_Email"];
      // temp_class.details["NGOType"]=i.data()["NGO_Type"];
      // temp_class.details["NGODistrict"]=i.data()["NGO_District"];
      temp_class.details["NGOAddress"]=i["NGO_Transactions"]["NGO_Address"];
      temp_class.details["TransactionTime"]=i["NGO_Transactions"]["Transaction_Time"];
      temp_class.details["TransactionValue"]=i["NGO_Transactions"]["Transaction_Value"];
      
      // temp_class.details["NGOPrivateKey"]=i.data()["NGO_PrivateKey"];

      // temp_class.details["NGOUserId"]=i.reference.id;
      // print(i["imageurl"].length);

      // temp_class.details["NGOImageNo"]=i.data()["imageurl"].length;
      // for (int j = 1; j <=i["imageurl"].length; j++)
      // {
      //   temp_class.details["NGOImage"+j.toString()]=i.data()["imageurl"]["image"+j.toString()];
      // }
      // temp_class.details["NGOImges"]["0"]=i["imageurl"]["image1"];
      // temp_class.details["NGOImges"]["1"]=i["imageurl"]["image1"];
      // temp_class.details["NGOImges"]["2"]=i["imageurl"]["image1"];
      // temp_class.details["NGOImges"]["3"]=i["imageurl"]["image1"];





      // searchItems.add(i["Property_Details"]["Property_name"]);
      // print("getdata called");
         Ngolist.add(temp_class);
     }
          print("aaaaaaaaaaaaaaaaa");
    print(Ngolist.length);
      //  
    }
    // for(int k=0;k<i["imageurl"].length){

    // }
   return Ngolist;
    // suggestionslist=Properties;
  });
}
  // void sign() async {
  //   token = await createAlbum10(_Phone_Number.text);
  //   print("ppppppppp");

  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => Verification(
  //         Username: _Name.text,
  //         password: _Password.text,
  //         gender: dropdownvalue.toString(),
  //         phoneNum: _Phone_Number.text,
  //       ),
  //     ),
  //   );
  //   if (token!.type == 'success') {
  //     print("Successful_register");
  //   } else {
  //     print('Failure');
  //   }
  // }

   void initState() {

    
    // TODO: implement initState
    ()async{
      await getData();
      setState(() {
      print("setstate calledd");
      // print(searchItems);
      // getData();
    });
    }();
   
   }



  Widget build(BuildContext context) {
     int offset = 0;
    int time = 800;
    return SafeArea(
          child: Scaffold(
            // key: _scaffoldKey,
              body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height* 0.0,
                    // color: Colors.blue,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.1,
                        left: MediaQuery.of(context).size.width * 0.1),

                    child: Text(
                      "Transaction History",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.1,
                        left: MediaQuery.of(context).size.width * 0.1),

                    //  color: Colors.blue,

                    child: Text(
                      "You can check all your transactions here",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontFamily: "Poppins Medium",
                        color: Colors.black,
                        // fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.06 ,
                    //   width: MediaQuery.of(context).size.width * 0.85,
                    //   // margin: const EdgeInsets.fromLTRB(32, 32,64, 32),
                    //   child: TextFormField(
                    //     style: TextStyle(color: Colors.black),
                    //     controller: _con,
                    //     onChanged: search,
                    //     decoration: InputDecoration(
                    //         fillColor: const Color(0xFFfafafa),
                    //         disabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 0, color: const Color(0xFFfafafa)),
                    //           borderRadius: BorderRadius.circular(5),
                    //         ),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 0, color: const Color(0xFFfafafa)),
                    //           borderRadius: BorderRadius.circular(5),
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(5),
                    //         ),
                    //         filled: true,
                    //         // fillColor: const Color(0xFF1E1E1E),
                    //         labelText: "Search here"),
                    //   ),
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.008,
                    ),
                    
                  ],
                ),
              ),

              //  SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.08,
              //  ),
              // SuggestionsDetailsList.length!=0?
               Container(
                child: Container(
                  child:
                    
                   Expanded(
                  child:Ngolist.length==0?
                    loading==true? Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.shade300,
                child: ShimmerLayout(),
                period: Duration(milliseconds: time),
              )
                    :Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Center(
                                child: Column(
                                  children: [
                                 
                                 Text( 
                                " Nothing to display",
                                style: TextStyle(
                                  color: Color(0xff3b3b3b),
                                  fontFamily: "MontBold",
                                  fontSize: MediaQuery.of(context).size.height * 0.0185
                                ),),
                                  Text( 
                                "",
                                style: TextStyle(
                                  color: Color(0xff3f60a0),
                                  fontFamily: "MontBold",
                                  fontSize: MediaQuery.of(context).size.height * 0.0092
                                ),),
                                
                                ],),
                              )


                              // ],)):Container()
                    
                    
                    ],)):Expanded(
                  child:ListView.builder(
                      
                    // scrollDirection: Axis.horizontal,
                    //  controller: _scrollController,

                itemCount: Ngolist.length,
                itemBuilder: (context, index) {
                  print(Ngolist.length);
                  final sea=Ngolist[index];
                  
                     int daysBetween(DateTime from, DateTime to) {
     from = DateTime(from.year, from.month, from.day);
     to = DateTime(to.year, to.month, to.day);
   return (to.difference(from).inHours / 24).round();
  }
                   Timestamp temp =
                                sea.details["TransactionTime"];
                                // String temp=tempw.substring(0,10);

                                // DateTime purchasedDate = DateTime(int.parse(temp.substring(0, 4)), int.parse(temp.substring(5,7)), int.parse(temp.substring(8,10)));
                                DateTime purchasedDate= DateTime(int.parse(temp.toDate().toString().substring(0, 4)), int.parse(temp.toDate().toString().substring(5,7)), int.parse(temp.toDate().toString().substring(8,10)));
                                print("purchase ddate");
                                 print(purchasedDate.toString());

                                DateTime currentDate = DateTime.now();
                                 print("curr ddate");
                                print(currentDate.toString());




                               final difference = daysBetween(purchasedDate,currentDate);
                                print("diff");
                               print(difference);

                   Timestamp Date= sea.details["TransactionTime"];
                        DateTime purchasedDate0 = DateTime(int.parse(Date.toDate().toString().substring(0, 4)), int.parse(Date.toDate().toString().substring(5,7)), int.parse(Date.toDate().toString().substring(8,10)));
                                String Dayinwords0=days[int.parse(purchasedDate0.weekday.toString())]!;
                                String Day0=Date.toDate().toString().substring(8, 10);
                                // final d=days[01];
                                String Month0=months[int.parse(purchasedDate0.month.toString())]!;
                                String year0=Date.toDate().toString().substring(2, 4);
                                String FinalPurchaseDate0="On"+" "+Dayinwords0+" "+","+ Day0+ " " +Month0+" "+year0;

                  return  Container(
                    child:difference>15 ?Container(
                    // shadowColor: Color.fromARGB(255, 180, 38, 236),
                    // color: Color(0xFF1E1E1E),
                    // elevation: 8,
                    // clipBehavior: Clip.antiAlias,
                    // shape: RoundedRectangleBorder(
                    //   // borderRadius: BorderRadius.circular(16),
                    // ),
                    child:
                        // ignore: unnecessary_new
                        new InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => null,
                        //   ),
                        // );
                      },
                      child: Container(
                        
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              //  color: Color.fromARGB(18, 113, 125, 137)
                              ),
                          padding: EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Container(
                                child: 
                                 Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    FinalPurchaseDate0,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                    ),
                                  ),
                                ],
                              )
                                
                                // if(true)...[],
                             
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Container(
                                  // height: MediaQuery.of(context).size.height * 0.15,
                                  child: Container(
                                // shadowColor: Color.fromARGB(255, 180, 38, 236),
                                // color: Color(0xFF1E1E1E),
                                // elevation: 8,
                                // clipBehavior: Clip.antiAlias,
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(0),
                                // ),
                                child:
                                    // ignore: unnecessary_new
                                    new InkWell(
                                  onTap: () {},
                                  child: Card(
                                    // decoration:
                                    // BoxDecoration(
                                    // color: Color.fromARGB(18, 113, 125, 137)),
                                    // padding: EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // mainAxisAlignment:MainAxisAlignment.spaceAround,
                                      children: [
                                        

                                     Container(
                                      child: Row(
                                        children: [Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.4,
                                                  margin: EdgeInsets.all(8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                child: FittedBox(fit: BoxFit.fill,
                                                child:  CachedNetworkImage(
        imageUrl: sea.details["NGOImage"],
      // progressIndicatorBuilder: (context, url, progress) =>Container(
      //   height: 20,
      //   width: 20,
      //   child:  Center(
      //             child: CircularProgressIndicator(
      //               value: progress.progress,
      //             ),
      //           ),
      // ),
        // 
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),)
                                              ),
                                            )
                                          ],
                                        )),
                                        // SizedBox(width: 5,),
                                        Container(
                                          // width: 200,
                                          // height: MediaQuery.of(context)
                                          //         .size
                                          //         .height /
                                          //     4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // crossAxisAlignment:
                                            // crossAxisAlignment:
                                                // CrossAxisAlignment.center,
                                            children: [
                                            Row(
                                              children: [  SizedBox(
                                                // fit: BoxFit.fitWidth,
                                                // width: MediaQuery.of(context).size.width*0,
                                                child: Text(
                                    sea.details["NGOName"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
                                    ),
                                  ),
                                              ),
                                              IconButton(
                  color: Colors.black,
            iconSize: 20,
            icon: const Icon(
              Icons.copy,
            ),
            onPressed: (){
              print(Address);
              FlutterClipboard.copy(sea.details["NGOAddress"])
        .then((value) => print('copied'));
            }
              ),],
                                            )

                                              
                                              // SizedBox(height: 8),
                                               
                                              
                                              // Text(
                                              //   ('Firm Name : ${data.docs[index]['Firm_Details']['Firm_name']}'),
                                              //   style: TextStyle(
                                              //     // fontWeight:FontWeight.bold,
                                              //     fontSize: 20,
                                              //     color: Colors.white,
                                              //   ),
                                              // ),
                                  //             FittedBox(
                                  //               fit: BoxFit.fitWidth,
                                  //               child: sea.details["warranty"]==null?
                                  //               Text(
                                  //   "Warranty of" +WarrantyDate+ "applicable",
                                  //   style: TextStyle(
                                  //     // fontWeight: FontWeight.bold,
                                  //     fontFamily: "Poppins Medium",
                                  //     color: Colors.black,
                                  //     // backgroundColor:Color(0x888888),
                                  //     // fontStyle: FontStyle.italic,
                                  // fontSize:
                                  //         MediaQuery.of(context).size.height *
                                  //             0.014,
                                  //   ),
                                  // ):Text(
                                  //   "Warranty of" +" "+ WarrantyDate+ "applicable",
                                  //   style: TextStyle(
                                  //     // fontWeight: FontWeight.bold,
                                  //     fontFamily: "Poppins Medium",
                                  //     color: Colors.black,
                                  //     // backgroundColor:Color(0x888888),
                                  //     // fontStyle: FontStyle.italic,
                                  //     fontSize:
                                  //         MediaQuery.of(context).size.height *
                                  //             0.014,
                                  //   ),
                                  // ),
                                  //             ),
                                            
                                              // SizedBox(height: 15),
                                              // Text(
                                              //   ('Yield : ${data.docs[index]['Property_Details']['Yield']}'),
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.bold,
                                              //     fontSize: 20,
                                              //     color: Colors.white,
                                              //   ),
                                              // ),

                                              //                    FirebaseFirestore.instance
                                              // .collection('users').document('')
                                              // .get()
                                              // .then((value) =>
                                              // print("Fetched ==>>>"+value.data["username"])),
                                            ],
                                          ),
                                        ),],
                                      ),
                                     ),
                                        Container(
                                          child:Text(
                                    sea.details["TransactionValue"]+" Wei",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins Medium",
                                      color: Colors.black,
                                      // fontStyle: FontStyle.italic,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
                                    ),
                                  ) ,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          )),
                    ),
                  ):Container()
                  );
                }
                  )
                    )
              ),
                )
               ),
              //  Container(
              //         color: Colors.blue,
              //         child: SuggestionsDetailsList.length==0?Container(
              //           child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [  Text("No purchases availableasssssssssssssssssss",
              //           style: TextStyle(color: Colors.black,),
              //           ),],
              //         ),
              //         ):Container()
                      
                    
              //       )
              
            ],
          ),
           ),
        );
  }

  Widget buildFittedWidthText(String text) => Container(
        // color: Colors.blue,
        // width: MediaQuery.of(context).size.width /2,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF002060),
              fontFamily: "Poppins Medium",
            ),
          ),
        ),
      );
  Widget buildFittedWidthText2(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(text),
        ),
      );
  Widget buildFittedWidthText3(String text) => Container(
        // color: Colors.blue,
        width: MediaQuery.of(context).size.width / 6.5,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      );
}
