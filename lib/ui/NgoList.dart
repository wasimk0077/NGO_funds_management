import 'dart:convert';
import 'dart:io';
import 'package:beta_app/net/dataobjects.dart';
import 'package:beta_app/ui/HomeView.dart';
import 'package:beta_app/ui/NGOView.dart';
import 'package:beta_app/ui/Trans_History.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

// import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart' as badges;
import 'login.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
// import 'package:Veots/screens/tab_view.dart';
// import 'package:Veots/screens/phone_view.dart';
// import 'package:badges/badges.dart' as badges;
// import 'package:connectivity_plus/connectivity_plus.dart';
// import '../models/class_models.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// import '../widgets/ham.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key, required this.mainLink});
  final String mainLink;
  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  //  var _scaffoldKey = new GlobalKey<ScaffoldState>();

//  String link = "";
//     Future<String?> initUniLinks() async {
//       // Platform messages may fail, so we use a try/catch PlatformException.
//       try {
//         final initialLink = await getInitialLink();
//         // Parse the link and warn the user, if it is not correct,
//         // but keep in mind it could be `null`.
//         return initialLink;
//       } on PlatformException {
//         // Handle exception by warning the user their action did not succeed
//         // return?
//       }
//     }

// AlbumPurchaseHistory? token;
  List<String?> Imagelist = [];
  List<NGOLIST> Ngolist = [];
  String? Address;
  String? PrivateKey;
  var etherBalance;
  getBalance() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.mainLink)
        .get()
        .then((value) {
      PrivateKey = value["User_PrivateKey"];
      Address = value["User_Address"];
      print("addressss" + Address.toString());
      checkAccountBalance();

      // for(var i in value.docs) {
      //   NGOLIST temp_class = new NGOLIST();
      //   temp_class.details["NGOName"]=i.data()["NGO_Name"];
      //   temp_class.details["NGOEmail"]=i.data()["NGO_Email"];
      //   temp_class.details["NGOType"]=i.data()["NGO_Type"];
      //   temp_class.details["NGODistrict"]=i.data()["NGO_District"];
      //   temp_class.details["NGOState"]=i.data()["NGO_State"];
      //   temp_class.details["NGODesc"]=i.data()["NGO_Desc"];
      //   print(i["imageurl"].length);

      //   temp_class.details["NGOImageNo"]=i.data()["imageurl"].length;
      //   for (int j = 1; j <=i["imageurl"].length; j++)
      //   {
      //     temp_class.details["NGOImage"+j.toString()]=i.data()["imageurl"]["image"+j.toString()];
      //   }
      //   // temp_class.details["NGOImges"]["0"]=i["imageurl"]["image1"];
      //   // temp_class.details["NGOImges"]["1"]=i["imageurl"]["image1"];
      //   // temp_class.details["NGOImges"]["2"]=i["imageurl"]["image1"];
      //   // temp_class.details["NGOImges"]["3"]=i["imageurl"]["image1"];

      //   // searchItems.add(i["Property_Details"]["Property_name"]);
      //   print("getdata called");
      //      Ngolist.add(temp_class);
      //       print("aaaaaaaaaaaaaaaaa");
      // print(Ngolist.length);
      //   //
      // }
      // for(int k=0;k<i["imageurl"].length){

      // }
      //  return Ngolist;
      // suggestionslist=Properties;
    });
  }

  checkAccountBalance() async {
    // Connect to the Ethereum network
    final rpcUrl =
        'https://sepolia.infura.io/v3/2f4a6c211b564f4fa2e2b467a023b925';
    final http.Client httpClient = http.Client();
    final Web3Client ethClient = Web3Client(rpcUrl, httpClient);

    // Create an Ethereum address from the provided string
    final ethereumAddress = EthereumAddress.fromHex(Address!);

    // Fetch the account balance
    final balance = await ethClient.getBalance(ethereumAddress);

    // Print the account balance
    etherBalance = balance.getValueInUnit(EtherUnit.ether);
    print('Account Balance: $etherBalance ETH');
    return etherBalance;
  }

  getData() async {
    await FirebaseFirestore.instance.collection("NGO").get().then((value) {
      for (var i in value.docs) {
        NGOLIST temp_class = new NGOLIST();
        if (i.data()["NGO_Activity"] != null) {
          temp_class.details["NGOActivityDesc"] =
              i.data()["NGO_Activity"]["NGO_Desc"];
          temp_class.details["NGOActivityImageNo"] =
              i.data()["NGO_Activity"]["imageurl"].length;
          for (int j = 1;
              j <= i.data()["NGO_Activity"]["imageurl"].length;
              j++) {
            temp_class.details["NGOActivityImage" + j.toString()] =
                i.data()["NGO_Activity"]["imageurl"]["image" + j.toString()];
          }
        } else {
          temp_class.details["NGOActivityDesc"] = "false";
        }
        temp_class.details["NGOName"] = i.data()["NGO_Name"];
        temp_class.details["NGOEmail"] = i.data()["NGO_Email"];
        temp_class.details["NGOType"] = i.data()["NGO_Type"];
        temp_class.details["NGODistrict"] = i.data()["NGO_District"];
        temp_class.details["NGOState"] = i.data()["NGO_State"];
        temp_class.details["NGODesc"] = i.data()["NGO_Desc"];
        temp_class.details["NGOAddress"] = i.data()["NGO_Address"];
        temp_class.details["NGOUniqueID"] = i.data()["NGO_UniqueID"];
        if (i.data()["NGOTest"] != null) {
          temp_class.details["NGOTests"] = i.data()["NGOTest"];
        }
        temp_class.details["NGOCategory"] = i.data()["NGO_Category"];

        temp_class.details["NGOPrivateKey"] = i.data()["NGO_PrivateKey"];

        temp_class.details["NGOUserId"] = i.reference.id;
        print(i["imageurl"].length);

        temp_class.details["NGOImageNo"] = i.data()["imageurl"].length;
        for (int j = 1; j <= i["imageurl"].length; j++) {
          temp_class.details["NGOImage" + j.toString()] =
              i.data()["imageurl"]["image" + j.toString()];
        }
        // temp_class.details["NGOImges"]["0"]=i["imageurl"]["image1"];
        // temp_class.details["NGOImges"]["1"]=i["imageurl"]["image1"];
        // temp_class.details["NGOImges"]["2"]=i["imageurl"]["image1"];
        // temp_class.details["NGOImges"]["3"]=i["imageurl"]["image1"];

        // searchItems.add(i["Property_Details"]["Property_name"]);
        print("getdata called");
        Ngolist.add(temp_class);
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

  bool noresultsfound = false;
  int offset = 0;
  int time = 800;
  double containerWidth = 200;
  double containerHeight = 10;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _scrollController = ScrollController();
  int _currentMax = 5;
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
  bool flag = false;

  bool loading = true;
  TextEditingController _controller = TextEditingController();
  // List<Details> DetailsList = [];
  // List<Details> SearchDetailsList = [];
  // List<Details> orderedDetailsList = [];
  //  List<Details> SearchorderedDetailsList = [];
  List<String> searchItems = ["a", "b", "c", "d"];

  //  List<Details> SuggestionsDetailsList = [];
  //  List<Details> SearchSuggestionsDetailsList = [];
  String FinalPurchaseDate0 = "";

  //  String
  bool filter1 = false;
  bool filter2 = false;
  bool filter3 = false;
  bool filter4 = false;
  bool filter5 = false;
  bool b1pressed = false;
  bool b2pressed = false;
  bool b3pressed = false;
  bool b4pressed = false;
  bool b5pressed = false;

  void search(String query) {
    final suggestions1 = Ngolist.where((element) {
      final item = element.details["NGOName"].toLowerCase();
      // final item2=element.details["prodName"].toLowerCase();
      final input = query.toLowerCase();
      return (item.contains(input));
    }).toList();

    var seen = Set<String>();
// List<NGOLIST> uniquelist = suggestions1;
    List<NGOLIST> uniquelist = suggestions1
        .where((student) => seen.add(student.details["NGOName"]))
        .toList();
    List<NGOLIST> emptyList = [];

    setState(() {
      Ngolist = uniquelist;

      if (suggestions1.isEmpty) {
        Ngolist = emptyList;
        loading = false;
      }
    });
  }

  OverlayEntry? overlayEntry;
  @override
  // void initState() {
  //   // initUniLinks().then((value) => this.setState(() {
  //   //       link = value!;
  //   //     }));
  //   super.initState();

  //
  //
  // }

//   bool? checkdata(){
//      Future.delayed(const Duration(milliseconds: 1000), () {

// // Here you can write your code

//    if(SuggestionsDetailsList.length==0)
//     {
//     setState(() {

//       loading=false;
//       // flag=false;
//     });
//   return true;
//   }
// });
//   }

  void initState() {
    // TODO: implement initState
    () async {
      await getData();
      setState(() {
        print("setstate calledd");
        print(searchItems);
        // getData();
      });
    }();
    () async {
      await getBalance();
      setState(() {
        print("setstate calledd");
        print(searchItems);
        getBalance();
      });
    }();
    // ()async{
    //   await checkAccountBalance();
    //   setState(() {
    //   print("setstate calledd");
    //   print(searchItems);
    //   // getData();
    // });
    // }();

    print("initSate called\n");
    print(searchItems);
    super.initState();

//         () async {
//       await getSearchData();
//       setState(() {
//         print("setstate calledd");
//         print(searchItems);
//         // getData();

//       });
//     }();
//     // TODO: implement initState
//     () async {
//       await getData(0,_currentMax);
//       setState(() {
//         print("setstate calledd");
//         print(searchItems);
//         // getData();

//       });
//     }();

// _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//        () async {
//       await getData(_currentMax,_currentMax+5);
//       setState(() {
//         print("setstate calledd");
//         print(searchItems);
//         // getData();

//       });
//     }();
//       }
//     });

//      () async {
//       await checkdata();
//       setState(() {
//         print("setstate calledd");
//         print(searchItems);
//         // getData();

//       });
//     }();

    print("initSate called\n");
    print(searchItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (() async {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => Phone_view())),
            (Route<dynamic> route) => false,
          );
          return true;
        }),
        child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: Column(
              children: [
                // AppBar()
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5],
                      colors: [
                        Color(0xff886ff2),
                        Color(0xff6849ef),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back!😀\nGlad to see you back",
                            // selectionColor: Colors.white,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontFamily: "Poppins Medium",
                            ),

                            // style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                    color: Colors.white,
                                    iconSize: 30,
                                    icon: const Icon(
                                      Icons.history,
                                    ),
                                    onPressed: () {
                                      print(Address);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Transaction_History_(
                                                    UserAdress:
                                                        Address!.toString(),
                                                  )));
                                    }),
                                IconButton(
                                  color: Colors.white,
                                  iconSize: 30,
                                  onPressed: () {
                                    showDialog(
                                        // barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Color(0xff002060),
                                            titlePadding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 6),
                                            shape: RoundedRectangleBorder(
                                                //<-- SEE HERE
                                                // side: BorderSide(
                                                //   color: Colors.greenAccent,
                                                // ),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                            title: Stack(
                                              children: [
                                                Container(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                          Color(0xff003296),
                                                          Color(0xff662da4)
                                                        ])),
                                                    // color: Colors.blue,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        if (MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width <
                                                            600) ...[
                                                          Text(
                                                            "Account Balance",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 20),
                                                          ),
                                                        ] else
                                                          Text(
                                                            "Account Balance",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 30),
                                                          ),
                                                      ],
                                                    )),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                      onPressed: (() {
                                                        // Navigator.of(context).pushAndRemoveUntil(
                                                        //   MaterialPageRoute(
                                                        //       builder: ((context) =>
                                                        //           HomeScreen(first_time: 0,))),
                                                        //   (Route<dynamic> route) => false,
                                                        // );
                                                        Navigator.pop(context);
                                                      }),
                                                      icon: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                      iconSize: 20,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            content: Text(
                                              'The available balance of your wallet is ' +
                                                  etherBalance.toString() +
                                                  " ETH",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05),
                                            ),
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.wallet,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: search,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 26,
                          ),
                          // suffixIcon: const Icon(
                          //   Icons.,
                          //   color:Color(0xff6849ef),
                          //   size: 26,
                          // ),
                          // helperText: "Search your topic",
                          // :,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Search here",
                          labelStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          isDense: true,
                        ),
                      )
                    ],
                  ),
                )
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 50,
                // ),
                // // Container(
                // //   // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
                // //   // margin: EdgeInsets.only(top: 0),
                // //   // color: Colors.red,
                // //   child:
                // // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 20,
                // ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Container(
                //       // height: MediaQuery.of(context).size.height* 0.0,
                //       // color: Colors.blue,
                //       margin: EdgeInsets.only(
                //           right: MediaQuery.of(context).size.width * 0.1,
                //           left: MediaQuery.of(context).size.width * 0.1),

                //       child: Text(
                //         "Welcome back",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontFamily: "Poppins Medium",
                //           color: Colors.black,
                //           // fontStyle: FontStyle.italic,
                //           fontSize: MediaQuery.of(context).size.width * 0.07,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(
                //           right: MediaQuery.of(context).size.width * 0.1,
                //           left: MediaQuery.of(context).size.width * 0.1),

                //       //  color: Colors.blue,

                //       child: Text(
                //         "We are glad to see you back.",
                //         style: TextStyle(
                //           // fontWeight: FontWeight.bold,
                //           fontFamily: "Poppins Medium",
                //           color: Colors.black,
                //           // fontStyle: FontStyle.italic,
                //           fontSize: MediaQuery.of(context).size.width * 0.04,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 40,
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 5, right: 5),
//                 child: Row(
//                   children: [

//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.06 ,
//                       width: MediaQuery.of(context).size.width * 0.85,
//                       // margin: const EdgeInsets.fromLTRB(32, 32,64, 32),
//                       child: TextFormField(
//                         style: TextStyle(color: Colors.black),
//                         controller: _controller,
//                         onChanged: search,
//                         decoration: InputDecoration(
//                             fillColor: const Color(0xFFfafafa),
//                             disabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 0, color: const Color(0xFFfafafa)),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 0, color: const Color(0xFFfafafa)),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             filled: true,
//                             // fillColor: const Color(0xFF1E1E1E),
//                             labelText: "Search here"),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.008,
//                     ),
//                      Container(
//                         height: MediaQuery.of(context).size.width * 0.08,
//                         width: MediaQuery.of(context).size.width * 0.08,
//                         decoration: BoxDecoration(
//                           color: Color(0xff002060),
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                         child: Center(
//                           child: FittedBox(
//                             child: InkWell(
//                               onTap: (){
//                                 showDialog(

//                           barrierDismissible: false,
//                           context: context,
//                           builder: (context) {
//                           return WillPopScope(
//                          onWillPop: () async => false,
//                          child:StatefulBuilder(
//       builder: (context, setState) {
//                     return AlertDialog(
//                               backgroundColor: Color(0xff002060),
//                               titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
//                               shape: RoundedRectangleBorder(
//                                   //<-- SEE HERE
//                                   // side: BorderSide(
//                                   //   color: Colors.greenAccent,
//                                   // ),
//                                   borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(10),
//                                       bottomRight: Radius.circular(10))),
//                               title: Stack(
//                                 children: [
//                                   Container(
//                                       height:
//                                             50,
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                           gradient: LinearGradient(colors: [
//                                         Color(0xff003296),
//                                         Color(0xff662da4)
//                                       ])),
//                                       // color: Colors.blue,
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           if (MediaQuery.of(context)
//                                                   .size
//                                                   .width <
//                                               600) ...[
//                                             Text(
//                                               "Filter",
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 20),
//                                             ),
//                                           ] else
//                                             Text(
//                                               "Filter",
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 30),
//                                             ),
//                                         ],
//                                       )),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       IconButton(
//                                         onPressed: (() {
//                                           // Navigator.of(context).push(MaterialPageRoute(
//                                           //    builder: (context) => Warranty(warrantyPeriod: widget.warrantyPeriod, Pimage: widget.Pimage , prodName: widget.prodName, cashBackPts: widget.cashBackPts, cashBackApp: widget.cashBackApp,)
//                                           //  ));

//                                         Navigator.pop(context);
//                                         }
//                                         ),
//                                         icon: Icon(
//                                           Icons.close,
//                                           color: Colors.white,
//                                         ),
//                                         iconSize: 20,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               content:Container(

//                               height: MediaQuery.of(context).size.height*0.2,
//                                 child:
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Purchase Date:",
//                                     style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       fontFamily: "Poppins Medium",
//                                       color: Colors.white,
//                                       // fontStyle: FontStyle.italic,
//                                       fontSize:
//                                           MediaQuery.of(context).size.width *
//                                               0.03,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                                     Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//               height: MediaQuery.of(context).size.height / 28,
//                 width: MediaQuery.of(context).size.width /5,
//                 decoration: BoxDecoration(

//                                       color: b1pressed?Colors.white:Color(0xff00b7ff),
//                                        borderRadius: BorderRadius.all(Radius.circular(5))
//                                         ),
//                 child: TextButton(
//                   onPressed: ()  {
//                    filter1=true;
//                    filter2=false;
//                    filter3=false;
//                    filter4=false;
//                    filter5=false;

//                   setState(() {
//         print("setstate calledd");
//         print(searchItems);
//           b1pressed=true;
//                    b2pressed=false;
//                    b3pressed=false;
//                    b4pressed=false;
//                    b5pressed=false;
//         // getData();

//       });

//                   },
//                   style: ButtonStyle( overlayColor: MaterialStateProperty.resolveWith<Color?>(
//       (Set<MaterialState> states) {
//         if (states.contains(MaterialState.pressed) )
//           return Colors.white; //<-- SEE HERE
//         return Colors.white; // Defer to the widget's default.
//       },
//     ),),
//                   child: Text(
//                     'Last 30 days',
//                     style: TextStyle(
//                     // fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     fontFamily: "Poppins Medium",
//                     fontSize: MediaQuery.of(context).size.height*0.01,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//               height: MediaQuery.of(context).size.height / 28,
//                 width: MediaQuery.of(context).size.width /6,
//                 decoration: BoxDecoration(

//                                       color: b2pressed?Colors.white:Color(0xff00b7ff),
//                                       borderRadius: BorderRadius.all(Radius.circular(5))
//                                       ),
//                 child: TextButton(
//                   onPressed: () async {
//                     filter1=false;
//                    filter2=true;
//                    filter3=false;
//                    filter4=false;
//                    filter5=false;
//                     setState(() {
//         print("setstate calledd");
//         print(searchItems);
//                    b1pressed=false;
//                    b2pressed=true;
//                    b3pressed=false;
//                    b4pressed=false;
//                    b5pressed=false;
//         // getData();

//       });
//                   },
//                   style:ButtonStyle( overlayColor: MaterialStateProperty.resolveWith<Color?>(
//       (Set<MaterialState> states) {
//         if (states.contains(MaterialState.pressed) )
//           return Colors.white; //<-- SEE HERE
//         return Colors.white; // Defer to the widget's default.
//       },
//     ),),
//                   child: Text(
//                     '2022',
//                     style: TextStyle(
//                      color: Colors.black,
//                     fontFamily: "Poppins Medium",
//                      fontSize: MediaQuery.of(context).size.height*0.01,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//               height: MediaQuery.of(context).size.height / 28,
//                 width: MediaQuery.of(context).size.width /6,
//                 decoration: BoxDecoration(

//                                       color: b3pressed?Colors.white:Color(0xff00b7ff),
//                                       borderRadius: BorderRadius.all(Radius.circular(5))
//                                       ),
//                 child: TextButton(
//                   onPressed: () async {
//                     filter1=false;
//                    filter2=false;
//                    filter3=true;
//                    filter4=false;
//                    filter5=false;
//                     setState(() {
//         print("setstate calledd");
//         print(searchItems);
//           b1pressed=false;
//                    b2pressed=false;
//                    b3pressed=true;
//                    b4pressed=false;
//                    b5pressed=false;
//         // getData();

//       });
//                   },
//                   style: ButtonStyle( overlayColor: MaterialStateProperty.resolveWith<Color?>(
//       (Set<MaterialState> states) {
//         if (states.contains(MaterialState.pressed) )
//           return Colors.white; //<-- SEE HERE
//         return Colors.white; // Defer to the widget's default.
//       },
//     ),),
//                   child: Text(
//                     '2021',
//                     style: TextStyle(
//                      color: Colors.black,
//                     fontFamily: "Poppins Medium",
//                      fontSize: MediaQuery.of(context).size.height*0.01,
//                     ),
//                   ),
//                 ),
//               ),
//                                       ],
//                                     ),

//                                     SizedBox(
//                                       height: MediaQuery.of(context).size.height*0.02,
//                                     ),
//                                      Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Container(
//               height: MediaQuery.of(context).size.height / 28,
//                 width: MediaQuery.of(context).size.width /5.5,
//                 decoration: BoxDecoration(

//                                       color: b4pressed?Colors.white:Color(0xff00b7ff) ,
//                                       borderRadius: BorderRadius.all(Radius.circular(5))
//                                       ),
//                 child: TextButton(
//                   onPressed: () async {
//                     filter1=false;
//                    filter2=false;
//                    filter3=false;
//                    filter4=true;
//                    filter5=false;
//                     setState(() {
//         print("setstate calledd");
//         print(searchItems);
//           b1pressed=false;
//                    b2pressed=false;
//                    b3pressed=false;
//                    b4pressed=true;
//                    b5pressed=false;
//         // getData();

//       });
//                   },
//                   style: ButtonStyle(
//     //                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//     // RoundedRectangleBorder(
//     //   borderRadius: BorderRadius.circular(64.0),
//     //   // side: BorderSide(color: Colors.red)
//     // )
//   overlayColor: MaterialStateProperty.resolveWith<Color?>(
//       (Set<MaterialState> states) {
//         if (states.contains(MaterialState.pressed) )
//           return Colors.white; //<-- SEE HERE
//         return Colors.white; // Defer to the widget's default.
//       },
//     ),),
//                   child: Text(
//                     '2020',
//                     style: TextStyle(
//                        color: Colors.black,
//                     fontFamily: "Poppins Medium",
//                     fontSize: MediaQuery.of(context).size.height*0.01,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//               height: MediaQuery.of(context).size.height / 28,
//                 width: MediaQuery.of(context).size.width /5.5,
//                 decoration: BoxDecoration(

//                                       color: b5pressed?Colors.white:Color(0xff00b7ff),
//                                       borderRadius: BorderRadius.all(Radius.circular(5))
//                                       ),
//                 child: TextButton(
//                   onPressed: () async {
//                     filter1=false;
//                    filter2=false;
//                    filter3=false;
//                    filter4=false;
//                    filter5=true;
//                     setState(() {
//         print("setstate calledd");
//         print(searchItems);
//           b1pressed=false;
//                    b2pressed=false;
//                    b3pressed=false;
//                    b4pressed=false;
//                    b5pressed=true;
//         // getData();

//       });
//                   },
//                   style: ButtonStyle( overlayColor: MaterialStateProperty.resolveWith<Color?>(
//       (Set<MaterialState> states) {
//         if (states.contains(MaterialState.pressed) )
//           return Colors.white; //<-- SEE HERE
//         return Colors.white; // Defer to the widget's default.
//       },
//     ),),
//                   child: Text(
//                     'Older',
//                     style: TextStyle(
//                     fontFamily: "Poppins Medium",
//                      color: Colors.black,
//                      fontSize: MediaQuery.of(context).size.height*0.01,
//                     ),
//                   ),
//                 ),
//               ),

//                                       ],
//                                     ),
//                                      SizedBox(
//                                       height: MediaQuery.of(context).size.height*0.02,
//                                     ),
//                                      Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Container(
//               height: MediaQuery.of(context).size.height / 28,
//                 width: MediaQuery.of(context).size.width /5,
//                 decoration: BoxDecoration(

//                                       color: Colors.deepPurple[800],
//                                       borderRadius: BorderRadius.all(Radius.circular(5))
//                                       ),
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     filter1=false;
//                    filter2=false;
//                    filter3=false;
//                    filter4=false;
//                    filter5=false;
//                    Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(64),
//                     ),
//                       primary: Colors.transparent,
//                       shadowColor: Colors.transparent),
//                   child: Text(
//                     'Cancel',
//                     style: TextStyle(fontWeight: FontWeight.bold,
//                     fontFamily: "Poppins Medium",
//                      fontSize: MediaQuery.of(context).size.height*0.01,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//               height: MediaQuery.of(context).size.height / 28,
//                 width: MediaQuery.of(context).size.width /5,
//                 decoration: BoxDecoration(

//                                       color: Colors.red[700],
//                                       borderRadius: BorderRadius.all(Radius.circular(5))
//                                       ),
//                 child: ElevatedButton(
//                   onPressed: () async {
// //                    if(filter1==true)
// //                    {
// //                           Navigator.of(context).push(MaterialPageRoute(
// //                     builder: (context) => PurchaseHistoryFIlter1(DetailsList: SearchorderedDetailsList,)
// //                   ));

// //                    }
// //                    else  if(filter2==true)
// //                    {
// // Navigator.of(context).push(MaterialPageRoute(
// //                     builder: (context) => PurchaseHistoryFIlter2(DetailsList: SearchorderedDetailsList,)
// // ));
// //                    }
// //                    else   if(filter3==true)
// //                    {
// //            Navigator.of(context).push(MaterialPageRoute(
// //                     builder: (context) => PurchaseHistoryFIlter3(DetailsList:SearchorderedDetailsList,)
// // ));
// //                    }
// //                    else    if(filter4==true)
// //                    {
// //      Navigator.of(context).push(MaterialPageRoute(
// //                     builder: (context) => PurchaseHistoryFIlter4(DetailsList: SearchorderedDetailsList,)
// // ));
// //                    }
// //                    else     if(filter5==true)
// //                    {
// // Navigator.of(context).push(MaterialPageRoute(
// //                     builder: (context) => PurchaseHistoryFIlter5(DetailsList: SearchorderedDetailsList,)
// // ));
// //                    }
// //                    else  {
// // // showOverlay(context,"user not found");
// //           //    final snackBar = SnackBar(
// //           //   content: Text('Hey! This is a SnackBar message.'),
// //           //   duration: Duration(seconds: 5),
// //           //   action: SnackBarAction(
// //           //     label: 'Undo',
// //           //     onPressed: () {
// //           //       // Some code to undo the change.
// //           //     },
// //           //   ),
// //           // );
// //           // // Scaffold.of(context).SnackBar(snackBar);
// //           //    ScaffoldMessenger.of(context).showSnackBar(snackBar);

// //                     print("please choose a filter");
// //                    }
//                   },
//                   style: ElevatedButton.styleFrom(
//                       primary: Colors.transparent,
//                       shadowColor: Colors.transparent),
//                   child: Text(
//                     'Apply',
//                     style: TextStyle(fontWeight: FontWeight.bold,
//                     fontFamily: "Poppins Medium",
//                      fontSize: MediaQuery.of(context).size.height*0.01,
//                     ),
//                   ),
//                 ),
//               ),

//                                       ],
//                                     ),
//                                   ],
//                                 )

//                                 ,

//                               )
//                             );

//       }
//                             ));
//                           }
//                           );
//                               }
//                                 // widget.keyD.currentState?.openDrawer();

//                               ,
//                               child: Icon(
//                                 Icons.filter_list,
//                                 size: MediaQuery.of(context).size.width * 0.05,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         )),

// //
//                   ],
//                 ),
//               ),

                //  SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.08,
                //  ),
                // SuggestionsDetailsList.length!=0?
                ,
                Container(
                    child: Container(
                  child: Ngolist.length == 0
                      ? loading == true
                          ? Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey.shade300,
                              child: ShimmerLayout(),
                              period: Duration(milliseconds: time),
                            )
                          : Expanded(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        " Nothing to display",
                                        style: TextStyle(
                                            color: Color(0xff3b3b3b),
                                            fontFamily: "MontBold",
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0185),
                                      ),
                                      Text(
                                        "",
                                        style: TextStyle(
                                            color: Color(0xff3f60a0),
                                            fontFamily: "MontBold",
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0092),
                                      ),
                                    ],
                                  ),
                                )

                                // ],)):Container()
                              ],
                            ))
                      : Expanded(
                          child: ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          itemCount: Ngolist.length,
                          itemBuilder: (context, index) {
                            print(Ngolist.length);
                            final sea = Ngolist[index];

                            // String WarrantyDate= " 0 days ";

                            // final sea = SuggestionsDetailsList[index];
                            // if(sea.details["warranty"]!=null)
                            // {
                            //   if(((sea.details["warranty"])/30).toInt()==0)
                            //   {
                            //     WarrantyDate=(((sea.details["warranty"])).toInt()).toString()+ " days ";
                            //   }
                            //   else{
                            //     WarrantyDate=(((sea.details["warranty"])/30).toInt()).toString()+" months ";
                            //   }
                            // }
                            // String prevDate(){
                            // if(index!=0)
                            // {
                            //   final sea0=SuggestionsDetailsList[index-1];
                            //      String temp0 =
                            //               sea0.details["purchaseDate"].substring(0, 10);
                            //           String res0 = temp0.substring(8, 10) +
                            //               "-" +
                            //               temp0.substring(5, 7) +
                            //               "-" +
                            //               temp0.substring(0, 4);
                            //               DateTime purchasedDate0 = DateTime(int.parse(temp0.substring(0, 4)), int.parse(temp0.substring(5,7)), int.parse(temp0.substring(8,10)));
                            //               String Dayinwords0=days[int.parse(purchasedDate0.weekday.toString())]!;
                            //               String Day0=temp0.substring(8, 10);
                            //               // final d=days[01];
                            //               String Month0=months[int.parse(purchasedDate0.month.toString())]!;
                            //               String year0=temp0.substring(2, 4);
                            //               String FinalPurchaseDate0="On"+" "+Dayinwords0+" "+","+ Day0+ " " +Month0+" "+year0;

                            //               return FinalPurchaseDate0;
                            // }
                            // else
                            // {
                            //   return "";

                            // }
                            //                }
                            //                 String FinalPurchaseDate0=prevDate();

                            // String temp =
                            //               sea.details["purchaseDate"].substring(0, 10);
                            //           String res = temp.substring(8, 10) +
                            //               "-" +
                            //               temp.substring(5, 7) +
                            //               "-" +
                            //               temp.substring(0, 4);
                            //               DateTime purchasedDate = DateTime(int.parse(temp.substring(0, 4)), int.parse(temp.substring(5,7)), int.parse(temp.substring(8,10)));
                            //               String Dayinwords=days[int.parse(purchasedDate.weekday.toString())]!;
                            //               String Day=temp.substring(8, 10);
                            //               // final d=days[01];
                            //               String Month=months[int.parse(purchasedDate.month.toString())]!;
                            //               String year=temp.substring(2, 4);
                            //               String FinalPurchaseDate="On"+" "+Dayinwords+" "+","+ Day+ " " +Month+" "+year;

                            return Container(
                                child: Container(
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
                                    // padding: EdgeInsets.all(4),
                                    child: Column(
                                      children: [
                                        // Container(
                                        //   child:

                                        //   // if(true)...[],

                                        // ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
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
                                                  child: Stack(
                                                    children: [
                                                      Card(
                                                        // color:  Color.fromARGBE(255, 214, 217, 249),

                                                        elevation: 8,
                                                        shadowColor:
                                                            Color.fromARGB(255,
                                                                106, 126, 218),
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        // padding: EdgeInsets.all(2),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          // mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Column(
                                                              children: [],
                                                            ),

                                                            Container(
                                                                child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.2,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      2.8,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                      child: FittedBox(
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              sea.details["NGOImage1"],
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
                                                                          errorWidget: (context, url, error) =>
                                                                              Icon(Icons.error),
                                                                        ),
                                                                      )),
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
                                                                    MainAxisAlignment
                                                                        .start,
                                                                // crossAxisAlignment:
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    // fit: BoxFit.fitWidth,
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.5,
                                                                    child: Text(
                                                                      sea.details[
                                                                          "NGOName"],
                                                                      style:
                                                                          TextStyle(
                                                                        // fontWeight: FontWeight.bold,
                                                                        fontFamily:
                                                                            "Poppins Medium",
                                                                        color: Colors
                                                                            .black,
                                                                        // fontStyle: FontStyle.italic,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height *
                                                                                0.02,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.01,
                                                                  ),
                                                                  // SizedBox(height: 8),
                                                                  FittedBox(
                                                                    fit: BoxFit
                                                                        .fitWidth,
                                                                    child: Text(
                                                                      sea.details[
                                                                          "NGOType"],
                                                                      style:
                                                                          TextStyle(
                                                                        // fontWeight: FontWeight.bold,
                                                                        fontFamily:
                                                                            "Poppins Medium",
                                                                        // color: Colors.black,
                                                                        backgroundColor:
                                                                            Color(0x888888),
                                                                        // fontStyle: FontStyle.italic,
                                                                        fontSize:
                                                                            MediaQuery.of(context).size.height *
                                                                                0.02,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.01,
                                                                  ),
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
                                                                  TextButton(
                                                                    onPressed:
                                                                        // nullp
                                                                        // ("g");n
                                                                        () {
                                                                      Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (context) => DetailPage(
                                                                              Snapshot: sea,
                                                                              PrivateKey: PrivateKey!,
                                                                              Address: Address!)));
                                                                    },
                                                                    child:
                                                                        FittedBox(
                                                                      fit: BoxFit
                                                                          .fitWidth,
                                                                      child:
                                                                          Text(
                                                                        "Click for more details    \u{2192}",
                                                                        style:
                                                                            TextStyle(
                                                                          // fontWeight: FontWeight.bold,
                                                                          fontFamily:
                                                                              "Poppins Medium",
                                                                          backgroundColor:
                                                                              Color(0x3f60a0),
                                                                          // color: Color.fromARGB(255, 29, 52, 70),
                                                                          // backgroundColor:Color(0x888888) ,
                                                                          // fontStyle: FontStyle.italic,
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height * 0.017,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      sea.details["NGOActivityDesc"]=="false"? Container():Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [Container(
                                                        // margin: EdgeInsets.only(
                                                        //     left: 100),
                                                        alignment:
                                                            Alignment.topRight,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            20,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                        child: Icon(Icons
                                                            .notifications_on_sharp,color: Colors.yellow[700],size: 35,),
                                                      ),],
                                                      )
                                                    ],
                                                  )),
                                        ))
                                      ],
                                    )),
                              ),
                            ));
                          },
                        )),
                )),
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
            //  drawer:  HamWidget()
          ),
        ));
  }
}

Widget buildFittedWidthText(String text) => Container(
      // color: Colors.blue,
      // width: MediaQuery.of(context).size.width / 2.5,
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins Medium",
              fontWeight: FontWeight.bold),
        ),
      ),
    );

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        offset += 5;
        time = 800 + offset;

        print(time);

        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: ShimmerLayout(),
              period: Duration(milliseconds: time),
            ));
      },
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 200;
    double containerHeight = 10;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 7.5),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth * 0.65,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth * 0.65,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth * 0.65,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth * 0.65,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: containerHeight,
                      width: containerWidth * 0.65,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
