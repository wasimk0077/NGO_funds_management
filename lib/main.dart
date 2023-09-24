import 'package:beta_app/ui/AddNGOImages.dart';
import 'package:beta_app/ui/Auth.dart';
import 'package:beta_app/ui/Events.dart';
import 'package:beta_app/ui/HomePage.dart';
import 'package:beta_app/ui/HomeView.dart';
import 'package:beta_app/ui/NGOView.dart';
import 'package:beta_app/ui/NgoList.dart';
import 'package:beta_app/ui/Trans_History.dart';
import 'package:beta_app/ui/Trans_History_wrt_One.dart';
import 'package:beta_app/ui/login.dart';
import 'package:beta_app/ui/send_otp.dart';
import 'package:beta_app/ui/updateNgoDetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:dynamic_links/homepage.dart';
// import 'package:dynamic_links/loginpage.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
    // this.initDynamicLinks();
  }

  // void initDynamicLinks() async {
  //   // var instance;
  //   FirebaseDynamicLinks!.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData dynamicLink?) async {
  //     final Uri deepLink = dynamicLink.link;
  //     print("deeplink found");
  //     if (deepLink != null) {
  //       print(deepLink);

  //       Get.to(() => HomeView());
  //     }
  //   }, onError: (OnLinkErrorException e) async {
  //     print("deeplink error");
  //     print(e.message);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:Phone_view()
    );
  }
}
