import 'package:beta_app/net/dataobjects.dart';
import 'package:beta_app/ui/Barchart.dart';
import 'package:beta_app/ui/updateNgoDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore, SetOptions;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import 'Trans_History_wrt_One.dart';
// import 'package:travel_blog/model/travel.dart';

class DetailPage2 extends StatelessWidget {
  // final Travel travel;
  final NGOLIST Snapshot;
  
  // final NGOLIST Snapshot;
 TextEditingController Amount = TextEditingController();

//  for(int i=0;i<5;i++){

//  }
    var etherBalance;
    String? Address;
    getBalance() async {

  await FirebaseFirestore.instance.collection("NGO").doc(Snapshot.details["NGOUserId"]).get().then((value) {


    //  PrivateKey=value["User_PrivateKey"];
    //  Address=value["User_Address"];
    //  print(Address);
     print("addressss"+Address.toString());
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
  final rpcUrl = 'https://sepolia.infura.io/v3/2f4a6c211b564f4fa2e2b467a023b925';
  final http.Client httpClient = http.Client();
  final Web3Client ethClient = Web3Client(rpcUrl, httpClient);

  // Create an Ethereum address from the provided string
  final ethereumAddress = EthereumAddress.fromHex(Snapshot.details["NGOAddress"]!);

  // Fetch the account balance
  final balance = await ethClient.getBalance(ethereumAddress);

  // Print the account balance
   etherBalance = balance.getValueInUnit(EtherUnit.ether);
     print('Account Balance: $etherBalance ETH');
   return etherBalance;
}



  List<String?> Imagelist=[];
  final double expandedHeight = 300;
  final double roundedContainerHeight = 50;
  DetailPage2({super.key,required this.Snapshot,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            _buildSilverHead(),
            SliverToBoxAdapter(
              child: _buildDetail( context),
            )
            ,
            // ElevatedButton(
            //     child: Text(
            //       'Log In',
            //       style:
            //           TextStyle(
            //              fontFamily: "Poppins Medium",fontSize: MediaQuery.of(context).size.width * 0.035),
            //     ),
            //     // style: ButtonStyle(
            //     //   backgroundColor: Color.fromRGBO(255, 22, 22, 1),
            //     // ),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Color.fromRGBO(255, 22, 22, 1),
            //         minimumSize: Size(MediaQuery.of(context).size.width * 0.38,
            //             MediaQuery.of(context).size.height * 0.046)),
            //     onPressed: () async    {
            //           // bool shouldnavigate =
            //           //     await signIn( name.text, password.text);
            //           // if (shouldnavigate) {
            //           //   final user = FirebaseAuth.instance.currentUser;
            //           //   Navigator.push(
            //           //     context,
            //           //     MaterialPageRoute(
            //           //       builder: (context) => PurchaseHistory(),
            //           //     ),
            //           //   );
            //           //   print(user!.email);
            //           // }
            //         },
            //   ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, right: 15, left: 15),
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white)),
                 IconButton(
                  color: Colors.white,
            iconSize: 30,
            icon: const Icon(
              Icons.history_rounded,
            ),
            onPressed: (){
              print(Address);
              Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>Transaction_History_Wrt_One(NGOAddress: Snapshot.details["NGOAddress"],)
                  ));
            }
              ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildSilverHead() {
    return SliverPersistentHeader(
        delegate: DetailSliverDelegate(
            // travel: travel,
            Snapshott: Snapshot,
            expandedHeight: expandedHeight,
            roundedContainerHeight: roundedContainerHeight));
  }

  Widget _buildDetail(BuildContext context) {
    
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildUserInfo(context),
           
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child:  Snapshot.details["NGODesc"]!=""? Text(
              // 'Lorem ipsum dolor sit amet, consectetur adpiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
               Snapshot.details["NGODesc"],
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
            ):Container()
          ),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1.5),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 160, child: FeaturedWidget(Snapshott: Snapshot,)),

           Container(
            child: Snapshot.details["NGOActivityDesc"]=="false"? Container():Column(
              children: [Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Updated Activity',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1.5),
                ),
                // Text(
                //   'View all',
                //   style: TextStyle(
                //     color: Colors.deepOrange,
                //     fontSize: 16,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child:  Text(
              // 'Lorem ipsum dolor sit amet, consectetur adpiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
               Snapshot.details["NGOActivityDesc"],
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Updated Activity Pics',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1.5),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 160, child: FeaturedWidget2(Snapshott: Snapshot,)),],
            ),
           ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          //   child: Text(
          //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          //   //  Snapshot.details["NGO_Desc"]
          //    style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
          //   ),
          // ),
          // Te\
          //xt(Snapshot.details["NGORating1"].toString(),style: TextStyle(color: Colors.black),),
         SizedBox(height: 10,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ Card(
                color:  Colors.grey,
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),

                child:Column(
                children: [
                  // Text("No of Property types",
                  // style: TextStyle(color: Colors.white),),
                  
                  Container(
                width: MediaQuery.of(context).size.width/2,
                height: 200,
                
                   
                    child: BarChartSample1(Snapshot.details["NGORating1"].toString(),Snapshot.details["NGORating2"].toString(),Snapshot.details["NGORating3"].toString(),Snapshot.details["NGORating4"].toString(),Snapshot.details["NGORating5"].toString())
                    //  child: BarChartSample1("1","2","3","4","5")
                ),
                ],
              ) ,
              ),
                Column(children: [
                  Container(
                
                width: 150,
                child: ElevatedButton(
                child: Text(
                  'Check Balance',
                  style:
                      TextStyle(
                         fontFamily: "Poppins Medium",),
                ),
                // style: ButtonStyle(
                //   backgroundColor: Color.fromRGBO(255, 22, 22, 1),
                // ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    // minimumSize: Size(MediaQuery.of(context).size.width * 0.38,
                    //     MediaQuery.of(context).size.height * 0.046)
                        ),
                onPressed: () async    {
                   

                    print(Snapshot.details["NGOName"]);

                  getBalance();
                  print(etherBalance);
                  Future.delayed(const Duration(milliseconds: 5000), () {

// Here you can write your code
                      showDialog(
                                  // barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Color(0xff002060),
                                      titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                      shape: RoundedRectangleBorder(
                                          //<-- SEE HERE
                                          // side: BorderSide(
                                          //   color: Colors.greenAccent,
                                          // ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10))),
                                      title: Stack(
                                        children: [
                                          Container(
                                              height:
                                                50,
                                              width:
                                                  MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                Color(0xff003296),
                                                Color(0xff662da4)
                                              ])),
                                              // color: Colors.blue,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      600) ...[
                                                    Text(
                                                      "Account Balance",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 20),
                                                    ),
                                                  ] else
                                                    Text(
                                                      "Account Balance",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                        'The available balance of your wallet is '+etherBalance.toString()+" ETH",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                MediaQuery.of(context).size.width *
                                                    0.05),
                                      ),
                                    );
                                  });

 
                  });
                  



                  
                    //   bool shouldnavigate =
                    //       await signIn( name.text, password.text);
                    //   if (shouldnavigate) {
                    //     final user = FirebaseAuth.instance.currentUser;
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => PurchaseHistory(),
                    //       ),
                    //     );
                    //     print(user!.email);
                    //   }
                    },
              ),),Container(
                
                width: 150,
                child: ElevatedButton(
                child: Text(
                  'Update',
                  style:
                      TextStyle(
                         fontFamily: "Poppins Medium",),
                ),
                // style: ButtonStyle(
                //   backgroundColor: Color.fromRGBO(255, 22, 22, 1),
                // ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    // minimumSize: Size(MediaQuery.of(context).size.width * 0.38,
                    //     MediaQuery.of(context).size.height * 0.046)
                        ),
                onPressed: () async    {
                   
Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>   UpdateNGODetails(Snapshot:Snapshot ,)));
                    
                    },
              ),),],)
              ],
         ),
          
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              
              Snapshot.details["NGOImage1"],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width:MediaQuery.of(context).size.width/2
                
                ,child: Text(
                  Snapshot.details["NGOName"],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),),
                Text(
                  Snapshot.details["NGOCategory"],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.share,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  // final Travel travel;
   final NGOLIST Snapshott;
    // FeaturedWidget({super.key,required this.Snapshott});
  final double expandedHeight;
  final double roundedContainerHeight;
  DetailSliverDelegate(
      {
        required this.Snapshott,
      required this.expandedHeight,
      required this.roundedContainerHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.network(Snapshott.details["NGOImage1"]
              ,width: MediaQuery.of(context).size.width,
              height: expandedHeight,
              fit: BoxFit.cover),
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
        ),
        Positioned(
            top: expandedHeight - shrinkOffset - 120,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(width:MediaQuery.of(context).size.width*0.8
                
                ,child: Text(
                  Snapshott.details["NGOName"],
                  style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
                ),),
                Text(
                  Snapshott.details["NGOState"],
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "#"+Snapshott.details["NGOUniqueID"],
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ))
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class FeaturedWidget extends StatelessWidget {
  // final _list = Snapshot.details[""]
  final NGOLIST Snapshott;
    FeaturedWidget({super.key,required this.Snapshott});
  @override
  List<String> Imagelist=[];
  getImageData()
  {
    print("ggs");
    for(int i=0;i<((Snapshott.details["NGOImageNo"]));i++)
    {
        Imagelist.add(Snapshott.details["NGOImage"+(i+1).toString()]);
        print(Imagelist[i]);
    }
    // return Imagelist;
  }
  Widget build(Object context) {
//     Future.delayed(Duration.zero,(){
//   // CheckIfAlreadyLoggedIn();
//    getImageData();
//   print(Imagelist.length);
// });
    return FutureBuilder(
    future: getImageData(),
    builder:(context, AsyncSnapshot snapshot) {
        // if (!snapshot.hasData) {
        //     return Center(child: CircularProgressIndicator());
        //  } 
         {
            return Container(
              margin: EdgeInsets.fromLTRB(10,0,0,0),
                child: ListView.separated(        
                  separatorBuilder: (_, index) => SizedBox(width: 20),                                          
                    itemCount: Imagelist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                        return  Container(
            width: 140,
            child: ClipRRect(
                                                 borderRadius: BorderRadius.circular(8.0),
                                                child:FittedBox(fit: BoxFit.fill,
                                                child: Image.network(Imagelist[index], fit: BoxFit.cover)
     ,)
                                              ),
            
          );                                         
                    }
                )
            );
         }
    }
);
  }
}
class FeaturedWidget2 extends StatelessWidget {
  // final _list = Snapshot.details[""]
  final NGOLIST Snapshott;
    FeaturedWidget2({super.key,required this.Snapshott});
  @override
  List<String> Imagelist=[];
  getImageData()
  {
    print("ggs");
    for(int i=0;i<((Snapshott.details["NGOActivityImageNo"]));i++)
    {
        Imagelist.add(Snapshott.details["NGOActivityImage"+(i+1).toString()]);
        print(Imagelist[i]);
    }
    // return Imagelist;
  }
  Widget build(Object context) {
//     Future.delayed(Duration.zero,(){
//   // CheckIfAlreadyLoggedIn();
//    getImageData();
//   print(Imagelist.length);
// });
    return FutureBuilder(
    future: getImageData(),
    builder:(context, AsyncSnapshot snapshot) {
        // if (!snapshot.hasData) {
        //     return Center(child: CircularProgressIndicator());
        //  } 
         {
            return Container(
              margin: EdgeInsets.fromLTRB(10,0,0,0),
                child: ListView.separated(        
                  separatorBuilder: (_, index) => SizedBox(width: 20),                                          
                    itemCount: Imagelist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                        return  Container(
            width: 140,
            child: ClipRRect(
                                                 borderRadius: BorderRadius.circular(8.0),
                                                child:FittedBox(fit: BoxFit.fill,
                                                child: Image.network(Imagelist[index], fit: BoxFit.cover)
     ,)
                                              ),
            
          );                                         
                    }
                )
            );
         }
    }
);
  }
}