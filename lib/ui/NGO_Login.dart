import 'package:beta_app/net/flutterfire.dart';
import 'package:beta_app/ui/HomeView.dart';
import 'package:beta_app/ui/NGOVIewthruNGO.dart';
import 'package:beta_app/ui/NgoList.dart';
import 'package:beta_app/ui/pre_register.dart';
// import 'package:authh_app/ui/BottomNavbar.dart';
// import 'package:authh_app/ui/ChangePassword.dart';
// import 'package:authh_app/ui/home_view.dart';
// import 'package:authh_app/ui/tenant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
// import 'package:authh_app/ui/home_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:beta_app/net/flutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_showcase/pages/home.dart';
import 'package:flutter/material.dart';

import '../net/dataobjects.dart';
// import 'package:firebase/auth/getAuth';

String? email;
bool ActiveConnection = false;
final name = TextEditingController();
final password = TextEditingController();
final formkey = GlobalKey<FormState>();
bool visible = true;
var credentials;

class Phone_view2 extends StatefulWidget {
  const Phone_view2({super.key, });
  // final String mainLink;
  @override
  State<Phone_view2> createState() => _Phone_view2State();
}

class _Phone_view2State extends State<Phone_view2> {

  List<NGOLIST> Ngolist=[];
getData(String user) async {
  print("not added");
  await FirebaseFirestore.instance.collection("NGO").doc(user).get().then((documentSnapshot) 


  {
    print("not added2");
    Map<String, dynamic> data = documentSnapshot.data()!;
      NGOLIST temp_class = new NGOLIST();
      if(data["NGO_Activity"]!=null)
      {
       temp_class.details["NGOActivityDesc"]=data["NGO_Activity"]["NGO_Desc"];
        temp_class.details["NGOActivityImageNo"]=data["NGO_Activity"]["imageurl"].length;
      for (int j = 1; j <=data["NGO_Activity"]["imageurl"].length; j++)
      {
        temp_class.details["NGOActivityImage"+j.toString()]=data["NGO_Activity"]["imageurl"]["image"+j.toString()];
      }

      }
      else{
        temp_class.details["NGOActivityDesc"]="false";
      }
      temp_class.details["NGOName"]=data["NGO_Name"];
      temp_class.details["NGOEmail"]=data["NGO_Email"];
      temp_class.details["NGOType"]=data["NGO_Type"];
      temp_class.details["NGODistrict"]=data["NGO_District"];
      temp_class.details["NGOState"]=data["NGO_State"];
      temp_class.details["NGODesc"]=data["NGO_Desc"];
      temp_class.details["NGOAddress"]=data["NGO_Address"];
      temp_class.details["NGOCategory"]=data["NGO_Category"];
      temp_class.details["NGOUniqueID"]=data["NGO_UniqueID"];

       temp_class.details["NGORating1"]=data["NGO_Rating"]["1"];
       temp_class.details["NGORating2"]=data["NGO_Rating"]["2"];
       temp_class.details["NGORating3"]=data["NGO_Rating"]["3"];
       temp_class.details["NGORating4"]=data["NGO_Rating"]["4"];
       temp_class.details["NGORating5"]=data["NGO_Rating"]["5"];
      
      temp_class.details["NGOPrivateKey"]=data["NGO_PrivateKey"];

      temp_class.details["NGOUserId"]=user;
      // print(i["imageurl"].length);

      temp_class.details["NGOImageNo"]=data["imageurl"].length;
      for (int j = 1; j <=data["imageurl"].length; j++)
      {
        temp_class.details["NGOImage"+j.toString()]=data["imageurl"]["image"+j.toString()];
      }
      Ngolist.add(temp_class);
      print("added");
      // Ngolist.add(temp_class);
      return Ngolist;
      // temp_clas
  });
  
 


    
    //   NGOLIST temp_class = new NGOLIST();
    //   temp_class.details["NGOName"]=value.data()["NGO_Name"];
    //   temp_class.details["NGOEmail"]=i.data()["NGO_Email"];
    //   temp_class.details["NGOType"]=i.data()["NGO_Type"];
    //   temp_class.details["NGODistrict"]=i.data()["NGO_District"];
    //   temp_class.details["NGOState"]=i.data()["NGO_State"];
    //   temp_class.details["NGODesc"]=i.data()["NGO_Desc"];
    //   temp_class.details["NGOAddress"]=i.data()["NGO_Address"];
    //   temp_class.details["NGOPrivateKey"]=i.data()["NGO_PrivateKey"];
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
    // //  
    
    // for(int k=0;k<i["imageurl"].length){

    // }
  //  return Ngolist;
    // suggestionslist=Properties;
  
}


  //   void forgotpwd_function() async {
  //   if (formkey.currentState!.validate()) {
  //     RegExp reg = RegExp(r'[0-9]{10}');
  //     print(name.text);
  //     print(password.text);
  //     CheckUserConnection();
  //     if (ActiveConnection)
  //     {
  //         //   credentials = await createAlbum(name.text, password.text,
  //         // (name.text.length == 10 && reg.hasMatch(name.text)) ? true : false);
  //     print("--------------------------------------------------");
  //     if ((name.text.length == 10 && reg.hasMatch(name.text))) {
  //       // SharedPreferences pref = await SharedPreferences.getInstance();

  //       // pref.setString('token', credentials.token);
  //       // pref.setString('udid', credentials.Udid);
  //       // pref.setString('name', credentials.name);
  //       // pref.setString('id', name.text);
        
  //       // name.text = '';
  //       // password.text = '';
  //       // widget.mainLink != ""
  //       //     ? Navigator.of(context).pushAndRemoveUntil(
  //       //         MaterialPageRoute(
  //       //             builder: ((context) => DisplayProdMain(
  //       //                 subLink: widget.mainLink.substring(32)))),
  //       //         (Route<dynamic> route) => false,
  //       //       )
  //       //     : Navigator.of(context).pushAndRemoveUntil(
  //       //         MaterialPageRoute(
  //       //             builder: ((context) => HomeScreen(
  //       //                   first_time: 0,
  //       //                 ))),
  //       //         (Route<dynamic> route) => false,
  //       //       );
  //       widget.mainLink == ""?
  //                               Navigator.of(context).push(
  //                                   MaterialPageRoute(
  //                                       builder: ((context) => Forgot_password(
  //                                           main_Link: widget.mainLink,phoneNum: name.text,))),
                                  
  //                                 )
  //                                 :Navigator.of(context).push(
  //                                   MaterialPageRoute(
  //                                       builder: ((context) => Forgot_password(
  //                                           main_Link: widget.mainLink.substring(32),phoneNum: name.text,))),
                                  
  //                                 );
  //     } else {
  //       final show = SnackBar(
  //           content: Text(
  //             "Please enter your Email/Phone",
  //             style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
  //             textAlign: TextAlign.center,
  //           ),
  //           backgroundColor: Color.fromRGBO(72, 72, 72, 0.9),
  //           behavior: SnackBarBehavior.floating,
  //           margin: EdgeInsets.only(
  //             left: MediaQuery.of(context).size.width * 0.25,
  //             right: MediaQuery.of(context).size.width * 0.25,
  //             bottom: MediaQuery.of(context).size.height * 0.05,
  //           ),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15.0),
  //           ));
  //       ScaffoldMessenger.of(context).showSnackBar(show);

       
  //     }
  //     }
  //     else{
        
  //       final show_net = SnackBar(
  //           content:FittedBox(child:Text(
  //               'please check your internet connection',
  //             style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
  //             textAlign: TextAlign.center,
  //           ),),
  //           backgroundColor: Color.fromRGBO(72, 72, 72, 0.9),
  //           behavior: SnackBarBehavior.floating,
  //           margin: EdgeInsets.only(
  //             left: MediaQuery.of(context).size.width * 0.18,
  //             right: MediaQuery.of(context).size.width * 0.18,
  //             bottom: MediaQuery.of(context).size.height * 0.05,
  //           ),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15.0),
  //           ));
  //       ScaffoldMessenger.of(context).showSnackBar(show_net);
  //     }
  //   }
  // }

  // void login_function() async {
  //   if (formkey.currentState!.validate()) {
  //     RegExp reg = RegExp(r'[0-9]{10}');
  //     print(name.text);
  //     print(password.text);
  //     CheckUserConnection();
  //     if (ActiveConnection)
  //     {
  //           credentials = await createAlbum(name.text, password.text,
  //         (name.text.length == 10 && reg.hasMatch(name.text)) ? true : false);
  //     print("--------------------------------------------------");
  //     if (credentials.success) {
  //       SharedPreferences pref = await SharedPreferences.getInstance();

  //       pref.setString('token', credentials.token);
  //       pref.setString('udid', credentials.Udid);
  //       pref.setString('name', credentials.name);
  //       pref.setString('id', name.text);
        
  //       name.text = '';
  //       password.text = '';
  //       widget.mainLink != ""
  //           ? Navigator.of(context).pushAndRemoveUntil(
  //               MaterialPageRoute(
  //                   builder: ((context) => DisplayProdMain(
  //                       subLink: widget.mainLink.substring(32)))),
  //               (Route<dynamic> route) => false,
  //             )
  //           : Navigator.of(context).pushAndRemoveUntil(
  //               MaterialPageRoute(
  //                   builder: ((context) => HomeScreen(
  //                         first_time: 0,
  //                       ))),
  //               (Route<dynamic> route) => false,
  //             );
  //     } else {
  //       final show = SnackBar(
  //           content: Text(
  //             credentials.message,
  //             style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
  //             textAlign: TextAlign.center,
  //           ),
  //           backgroundColor: Color.fromRGBO(72, 72, 72, 0.9),
  //           behavior: SnackBarBehavior.floating,
  //           margin: EdgeInsets.only(
  //             left: MediaQuery.of(context).size.width * 0.25,
  //             right: MediaQuery.of(context).size.width * 0.25,
  //             bottom: MediaQuery.of(context).size.height * 0.05,
  //           ),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15.0),
  //           ));
  //       ScaffoldMessenger.of(context).showSnackBar(show);

       
  //     }
  //     }
  //     else{
        
  //       final show_net = SnackBar(
  //           content:FittedBox(child:Text(
  //               'please check your internet connection',
  //             style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
  //             textAlign: TextAlign.center,
  //           ),),
  //           backgroundColor: Color.fromRGBO(72, 72, 72, 0.9),
  //           behavior: SnackBarBehavior.floating,
  //           margin: EdgeInsets.only(
  //             left: MediaQuery.of(context).size.width * 0.18,
  //             right: MediaQuery.of(context).size.width * 0.18,
  //             bottom: MediaQuery.of(context).size.height * 0.05,
  //           ),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(15.0),
  //           ));
  //       ScaffoldMessenger.of(context).showSnackBar(show_net);
  //     }
  //   }
  // }


  @override
  void initState() {
    // visible = true;
    // CheckUserConnection();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return
      Scaffold(body:(Column(children: [first_half1(context), second_half1(context)]))
    );
  }

  Widget first_half1(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(253, 253, 254, 1)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Padding(
        padding: EdgeInsets.only(
         top:MediaQuery.of(context).size.height * 0.025 , 
      ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 13,
              bottom:MediaQuery.of(context).size.height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // FittedBox(
                  //   child: Image.asset(
                  //     'assets/veots_logo_wo_tl.png',
                  //     width: MediaQuery.of(context).size.width * 0.18,
                  //     height: MediaQuery.of(context).size.height * 0.07,
                  //   ),
                  // ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // color: Colors.red,
                  child: FittedBox(
                    child: Image.asset(
                      'assets/Login.gif',
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.33,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget second_half1(BuildContext context) {
    return Expanded(
      child: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight:Radius.circular(12) ),
              color: Color.fromRGBO(0, 32, 96, 1)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              FittedBox(
                  child: Text(
                'Login',
                style: TextStyle( fontFamily: "Poppins Medium",
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    // ,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              )),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.00,
              // ),
              FittedBox(
                  child: Text('Sign in to Continue',
                      style: TextStyle(
                         fontFamily: "Poppins Medium",
                          fontSize: MediaQuery.of(context).size.width * 0.028,
                               fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Form(
                key: formkey,
                child: Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email/Phone',
                            style: TextStyle(
                               fontFamily: "Poppins Medium",
                                fontSize: MediaQuery.of(context).size.width * 0.025,
                                color: Colors.white,
                                letterSpacing: 1.2)),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                        TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width * 0.04),
                            decoration: InputDecoration(
                             
                              filled: true,
                              fillColor: Colors.white,
                              errorStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03),
                              contentPadding: EdgeInsets.only(
                                left: 20
                              ),
                              border:OutlineInputBorder(borderSide:BorderSide.none,
                               borderRadius: BorderRadius.circular(35) ),
                            ),
                            validator: (value) {
                              RegExp reg = RegExp(r'[0-9]{10}');
              
                              if (value==null|| value.isEmpty){
                                return null ;
                              }
                              else if ((
                                      !value.contains('@') ||
                                      !value.contains('.')) &&
                                  !((value.length == 10 && reg.hasMatch(value)))) {
                                return 'Invalid Email/Phone';
                              }
                            },
                          ),
                       
                        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                        Text('Password',
                            style: TextStyle(
                               fontFamily: "Poppins Medium",
                                fontSize: MediaQuery.of(context).size.width * 0.025,
                                color: Colors.white,
                                letterSpacing: 1.2)),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                         TextFormField(
                              onChanged: (value) {
                                if (!formkey.currentState!.validate()) {}
                              },
                              obscureText: visible,
                              controller: password,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                              decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,

                                  suffixIcon: IconButton(
                                    
                                    // padding: EdgeInsets.only(
                                    //     top: MediaQuery.of(context).size.height *
                                    //         0.01),
                                    iconSize:
                                        MediaQuery.of(context).size.width * 0.05,
                                    icon: Icon(
                                      color: Color(0xff4d4c4c),
                                      visible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                        
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                  ),
                              border:OutlineInputBorder(borderSide:BorderSide.none,
                               borderRadius: BorderRadius.circular(35) ),
                                  contentPadding: EdgeInsets.only(
                                    left: 20,
                                    // top: MediaQuery.of(context).size.height * 0.02,
                                    // bottom: MediaQuery.of(context).size.height*0.01
                                  )
                                  ),
                              validator: (value) {
                                // RegExp regex =
                                // RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                                // if (value!=null && !regex.hasMatch(value))
                                // {
                                //   return 'enter valid password' ;
                                // }
                              },
                            ),
                      
                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                          TextButton(
                              child: Text('',
                                  style: TextStyle(
                                     fontFamily: "Poppins Medium",
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.025,
                                      color: Colors.white,
                                      letterSpacing: 1.2)),
                              onPressed: (() {
                                print('Phone');
                                print(MediaQuery.of(context).size.width);
                                print(MediaQuery.of(context).size.height);
                                //   print(LOCATION?.latitude);
                                // print(LOCATION?.longitude);


                                // forgotpwd_function();
                                // widget.mainLink == ""?
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: ((context) => Forgot_password(
                                //             main_Link: widget.mainLink))),
                                  
                                //   )
                                //   :Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: ((context) => Forgot_password(
                                //             main_Link: widget.mainLink.substring(32)))),
                                  
                                //   );

                              })),
                        ])
                      ]),
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              ElevatedButton(
                child: Text(
                  'Log In',
                  style:
                      TextStyle(
                         fontFamily: "Poppins Medium",fontSize: MediaQuery.of(context).size.width * 0.035),
                ),
                // style: ButtonStyle(
                //   backgroundColor: Color.fromRGBO(255, 22, 22, 1),
                // ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 22, 22, 1),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.38,
                        MediaQuery.of(context).size.height * 0.046)),
                onPressed: () async    {
                      bool shouldnavigate =
                          await signIn( name.text, password.text);
                          final user = FirebaseAuth.instance.currentUser;
                          var collection =
                              FirebaseFirestore.instance.collection('NGO');
                          collection.doc(user!.uid);
                          getData(user!.uid);


                     Future.delayed(const Duration(milliseconds: 5000), () {
                     
                      if (shouldnavigate) {
                        final user = FirebaseAuth.instance.currentUser;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>DetailPage2(Snapshot: Ngolist.first,),
                          ),
                        );
                        print(user!.email);
                      }});
                    },
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.015,
              // ),
             
              
              
               
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ]
            ),
          )),
    );
  }


Future CheckUserConnection() async {
	try {
	final result = await InternetAddress.lookup('google.com');
	if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
		setState(() {
		ActiveConnection = true;
	
		});
	}
  else{
    setState(() {
	ActiveConnection = false;
	});
  }
	} on SocketException catch (_) {
	setState(() {
	ActiveConnection = false;
	});
	}
}

}

