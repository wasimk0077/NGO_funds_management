
import 'dart:math';

import 'package:beta_app/ui/AddNGOImages.dart';
import 'package:beta_app/ui/HomeView.dart';
import 'package:beta_app/ui/NgoList.dart';
import 'package:beta_app/ui/login.dart';
import 'package:beta_app/ui/user_otp_verify.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import '../net/flutterfire.dart';
import 'otp_screen.dart';
// import 'package:mjor_app/Verification.dart';
// import 'package:uuid/uuid.dart';
// import 'package:veots_mobile_app/screens/Verification_with_phone.dart';
// import 'package:veots_mobile_app/screens/login.dart';

// import '../widgets/Requests.dart';



class RegisterUser_ extends StatefulWidget {
  RegisterUser_({super.key, });
  // final String Link;

  @override
  State<RegisterUser_> createState() => RegisterUser_State();
}

class RegisterUser_State extends State<RegisterUser_> {

   EmailOTP myauth = EmailOTP();
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
  TextEditingController _NGOName = TextEditingController();
  TextEditingController _Phone_Number = TextEditingController();
  TextEditingController _District = TextEditingController();
  TextEditingController _State = TextEditingController();

  TextEditingController _Password = TextEditingController();
  TextEditingController _Confirm_Password = TextEditingController();
  String? dropdownvalue = null;

  final _ValidationKey = GlobalKey<FormState>();
  List<String> items = ["Male", "Female", "Others",];
  // Albumotpsend? token;

  bool visible = true;
  bool visible2 = true;
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

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpeg'), // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // youtube video
                    Container(
                      height: MediaQuery.of(context).size.height * .0001,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 7),
                        // height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 25,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        // color: Colors.blue,
                                        child:   Text(
                                          
                                          "Create New",
                                          style: TextStyle(
                                            height: 0.9,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            color: const Color(0xFF002060),
                                            fontFamily: "Poppins Medium",
                                          ),
                                        ),
                                      )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                       Container(
                                        padding: EdgeInsets.all(0),
                                        // color: Colors.blue,
                                        child:  Text(
                                          "Account",
                                          style: TextStyle(
                                            height: 0.9,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            color: const Color(0xFF002060),
                                            fontFamily: "Poppins Medium",
                                          ),
                                        ),
                                       )
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 40,
                                ),
                                Form(
                                    key: _ValidationKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "User Name",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      const Color(0xFFfafafa),
                                                ),
                                                child: TextFormField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter some text';
                                                      }

                                                      return null;
                                                    },
                                                    controller: _NGOName,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13),
                                                      border: InputBorder.none,
                                                    )))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Email ID",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                child: TextFormField(
                                                    validator: (value) {
                                                      // RegExp reg =
                                                      //     RegExp(r'[0-9]{10}');

                                                      // if (value == null ||
                                                      //     value.isEmpty) {
                                                      //   return 'Please enter mobile number';
                                                      // }
                                                      // if (!(value.length ==
                                                      //         10 &&
                                                      //     reg.hasMatch(
                                                      //         value))) {
                                                      //   return 'Please enter a valid mobile number';
                                                      // }

                                                      // return null;
                                                    },
                                                    controller: _Phone_Number,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13),
                                                      border: InputBorder.none,
                                                    )))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Gender",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          // height: MediaQuery.of(context).size.height/18,
                                          child: DropdownButtonFormField(
                                            iconEnabledColor:
                                                const Color(0xFFfafafa),
                                            hint: FittedBox(
                                              fit: BoxFit.fitHeight,
                                              child: Text(
                                                "Select",
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF4d4c4c),
                                                    fontFamily:
                                                        "Poppins Medium",
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            45),
                                              ),
                                            ),
                                            decoration: InputDecoration(
                                              fillColor:
                                                  const Color(0xFFfafafa),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              filled: true,
                                              // fillColor: const Color(0xFF1E1E1E),
                                            ),
                                            value: dropdownvalue,
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            items: items.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              dropdownvalue = newValue!;
                                              switch (dropdownvalue) {
                                                case "Male":
                                                  print(dropdownvalue);

                                                  break;
                                                case "Female":
                                                  print(dropdownvalue);
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) => ResidentialView(dropdownvalue)),
                                                  // );
                                                  break;
                                                case "Others":
                                                  print(dropdownvalue);

                                                  break;
                                                  // case "International":
                                                  // print(dropdownvalue);

                                                  // break;

                                                // break;
                                              }
                                            },
                                          ),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "District",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      const Color(0xFFfafafa),
                                                ),
                                                child: TextFormField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter some text';
                                                      }

                                                      return null;
                                                    },
                                                    controller: _District,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13),
                                                      border: InputBorder.none,
                                                    )))),
                                                    Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "State",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      const Color(0xFFfafafa),
                                                ),
                                                child: TextFormField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter some text';
                                                      }

                                                      return null;
                                                    },
                                                    controller: _State,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13),
                                                      border: InputBorder.none,
                                                    )))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Password",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color:
                                                      const Color(0xFFfafafa),
                                                ),
                                                child: TextFormField(
                                                    obscureText: visible2,
                                                    
                                                     validator: (value) {
                                                      // RegExp reg =
                                                      //     RegExp(r'[0-9]{10}');

                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please enter password';
                                                      }
                                                      if ((value.length <
                                                              8 
                                                        )) {
                                                        return 'Please enter a valid password';
                                                      }

                                                      return null;
                                                    
                                                    },
                                                    controller: _Password,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13,
                                                              top: 15),
                                                      border: InputBorder.none,
                                                      suffixIcon: IconButton(
                                                        iconSize: 15,
                                                        icon: Icon(
                                                          visible2
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .visibility,
                                                          color: const Color(
                                                              0xFF4d4c4c),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            visible2 =
                                                                !visible2;
                                                          });
                                                        },
                                                      ),
                                                    )))),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // color: Colors.blue,
                                                  // width: MediaQuery.of(context).size.width /2,
                                                  child: FittedBox(
                                                    child: Text(
                                                      "Confirm Password",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF004aad),
                                                          fontFamily:
                                                              "Poppins Medium"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            // height: MediaQuery.of(context).size.height / 18,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: const Color(
                                                        0xFFfafafa)),
                                                child: TextFormField(
                                                    obscureText: visible,
                                                   
                                                    
                                                    
                                                    controller:
                                                        _Confirm_Password,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 13,
                                                              top: 15),
                                                      border: InputBorder.none,
                                                      suffixIcon: IconButton(
                                                        iconSize: 15,
                                                        icon: Icon(
                                                          visible
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .visibility,
                                                          color: const Color(
                                                              0xFF4d4c4c),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            visible = !visible;
                                                          });
                                                        },
                                                      ),
                                                    )))),
                                      ],
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular((4.0)),
                                      color: Colors.red.shade500),
                                  child: MaterialButton(
                                    // color: Colors.amber,
                                    onPressed: () async{
                                      if (_Confirm_Password.text ==
                                          _Password.text) {
                                        if (_ValidationKey.currentState!
                                            .validate()) {
                                          // sign();
                                     
                      bool shouldnavigate =
                          await register(_Phone_Number.text, _Password.text);

                          create_identification();
                     Future.delayed(const Duration(milliseconds: 5000), () {

// Here you can write your code

  setState(() {
    // Here you can write your code for open new view
     if (shouldnavigate) {
                        if(true) 
                        {
                          {
                          print("entered");
                          final user = FirebaseAuth.instance.currentUser;
                          var collection =
                              FirebaseFirestore.instance.collection('users');
                          collection.doc(user!.uid) // <-- Document ID
                              .set({
                            // 'User_email':_Phone_Number.text,
                            // 'User_password': _Password.text,
                            // // 'User_type': 'Employee',
                            // 'User_name': name.text,
                            // 'User_mobile': _Phone_Number.text,

                            "User_Name":_NGOName.text,
                            "User_Email":_Phone_Number.text,
                            "User_Type":dropdownvalue,
                            "User_District":_District.text,
                            "User_State":_State.text,
                            "User_Password":_Password.text,
                            "User_PrivateKey":"0x$PrivateKey",
                            "User_Address":Address.toString()
                          });
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => AddImages(user.uid),
                          //   ),
                          // );
                           myauth.setConfig(
                              appEmail: "contact@hdevcoder.com",
                              appName: "Email OTP",
                              userEmail: _Phone_Number.text,
                              otpLength: 4,
                              otpType: OTPType.digitsOnly);
                              print("after registered");
                           Future.delayed(const Duration(milliseconds: 000), ()async {


                         print("after registered");
                          if (  await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>   VerificationEmail(myauth: myauth,userid:user!.uid)));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                           });
                                 
                        }
                        }
                      }
  });

});
                    



                                      
                                          
                                        }
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Error",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                content: Text(
                                                    'Confirm password is different than the password'),
                                              );
                                            });
                                      }
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Poppins Medium"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: MaterialButton(
                                    // color: Colors.amber,
                                    onPressed: (() {
                                      //                           Navigator.of(context).pushAndRemoveUntil(
                                      // MaterialPageRoute(
                                      //     builder: ((context) =>Login(mainLink: widget.Link))),
                                      // (Route<dynamic> route) => false,
                                      // );
          //                             Navigator.of(context).pushAndRemoveUntil(
          //   MaterialPageRoute(
          //       builder: ((context) => Phone_view())),
          //   (Route<dynamic> route) => false,
          // );
                                      // print(MediaQuery.of(context).size.width);
                                      create_identification();
                                      // print(PrivateKey);
                                      // print(Address.toString());
                                    }),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                            color: const Color(0xFF004aad),
                                            fontFamily: "Poppins Medium"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                ),

                                // validator: (value) {
                                //   if (value.isEmpty) {
                                //     return "Username cannot be empty";
                                //   }

                                //   return null;
                                // },
                                // onChanged: (value) {
                                //   name = value;
                                //   setState(() {});
                                // },
                              ],
                            )),
                      ),
                    ),

                    // comment section & recommended videos
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
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
