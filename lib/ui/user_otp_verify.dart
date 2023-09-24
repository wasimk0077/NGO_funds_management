import 'dart:math';

// import 'package:Veots/screens/CompanyNameScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:Veots/screens/home_page.dart';
// import '../widgets/Requests.dart';
import 'package:uuid/uuid.dart';
import 'package:beta_app/net/dataobjects.dart';
import 'package:beta_app/ui/login.dart';
import 'package:email_otp/email_otp.dart';
// import 'package:emailotp/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'NgoList.dart';


// import 'constants.dart';
class Otp extends StatelessWidget {
  const Otp({
    Key? key,
    required this.otpController,
  }) : super(key: key);
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height:50,
      child: TextFormField(
        controller: otpController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: ('0'),
        ),
        onSaved: (value) {},
      ),
    );
  }
}
class VerificationEmail extends StatefulWidget {
  VerificationEmail(
      {super.key,
     required this.myauth,required this.userid
      });
      
   final EmailOTP myauth ;
 final String userid ;

  @override
  State<VerificationEmail> createState() => _VerificationEmailState();
}

class _VerificationEmailState extends State<VerificationEmail> {
  // var uuid = Uuid();

  // bool register_loading=false;
  var v1 = Uuid().v1();
  TextEditingController _OTP = TextEditingController();
  String CODE = "";
 
  

  bool IsPhoneNo = false;
 

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    bool someBooleanValue = true;
     final EmailOTP myauth ;

    return Scaffold(
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
                padding: const EdgeInsets.only(top:8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                    Padding(padding: EdgeInsets.only(left:15)
                    ,child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                         
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF002060),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20)),
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 8,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        )
                      ],
                    ) ,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: buildFittedWidthText(
                                "Type a Verification Code"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: buildFittedWidthText("that we have sent"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: buildFittedWidthText(
                                "Enter your verification code below."),
                          ),
                        ],
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/ver.png"),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 6,
                      // width:MediaQuery.of(context).size.width / 1.3 ,
                      child: OtpTextField(
                        fillColor: Colors.white,
                        fieldWidth: MediaQuery.of(context).size.width / 5.6,
                        filled: true,
                        textStyle: TextStyle(color: Colors.black),
                        borderColor: Colors.white,
                        numberOfFields: 4,
                        borderWidth: 0,
                        autoFocus: true,
                        enabledBorderColor: Colors.white,
                        // borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        borderRadius: BorderRadius.all(Radius.circular(15)),

                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          // CODE=code;
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          CODE = verificationCode;
                          print("------------------");
                          print(CODE);
                          print("------------------");
                        }, // end onSubmit
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width /2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                         Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: MediaQuery.of(context).size.width / 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((4.0)),
                              color:const Color(0xFF002060),
                            ),
                            child: MaterialButton(
                              // color: Colors.amber,
                              onPressed: (()async {
                                 if (await widget.myauth.verifyOTP(otp: CODE) == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("OTP is verified"),
                ));
                (Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PurchaseHistory(mainLink: widget.userid,)),
                                    
                                  ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Invalid OTP"),
                ));
              }
                                // verify();
                              }),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "VERIFY NOW",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                      height: MediaQuery.of(context).size.height/50,
                    ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            height: MediaQuery.of(context).size.width / 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular((4.0)),
                                color: Colors.white),
                            child: MaterialButton(
                              // color: Colors.amber,
                              onPressed:() {
                                // resendcode();
                              },
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "RESEND CODE",
                                  style: TextStyle(
                                    color: const Color(0xFF761af1),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFittedWidthText(String text) => Container(
        // color: Colors.blue,
        // width: MediaQuery.of(context).size.width / 2.5,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle( color: Colors.white,
            fontFamily: "Poppins Medium"),
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
        width: MediaQuery.of(context).size.width / 8,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 0.1}) {
    final width = MediaQuery.of(context).size.width / 2;
    double val = (width / 2000) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
