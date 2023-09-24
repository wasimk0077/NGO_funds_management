

import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:Veots/screens/constants.dart';
// import 'package:Veots/widgets/not_icon.dart';
// import 'package:Veots/widgets/send_accept.dart';

import 'package:beta_app/ui/HomeView.dart';
import 'package:beta_app/ui/NGOVIewthruNGO.dart';
import 'package:beta_app/ui/NgoList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:path/path.dart' as Path;

// import 'package:Veots/screens/warranty.dart';
// import 'package:Veots/widgets/ham.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'Notifications_view.dart';
// import 'home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../net/dataobjects.dart';
// import 'package:open_file/open_file.dart';
// import 'package:badges/badges.dart' as badges;


class  BillUploadcomment extends StatefulWidget {
  const  BillUploadcomment({super.key,required this.link});
final String link;

  @override
  State< BillUploadcomment> createState() => _MyWidgetState();
}

class _MyWidgetState extends State< BillUploadcomment> {
  bool proceed=false;
//   final ImagePicker imgpicker = ImagePicker();
// List<XFile>? imagefiles;


//   openImages() async {
// try {
//     var pickedfiles = await imgpicker.pickMultiImage();
//     //you can use ImageCourse.camera for Camera capture
//     if(pickedfiles != null){
//         imagefiles = pickedfiles;
//         setState(() {
//         });
//     }else{
//         print("No image is selected.");
//     }
// }catch (e) {
//     print("error while picking file.");
// }
//   }
  TextEditingController _Comment = TextEditingController();

  
// Album3? token;
//   Future getData() async {
    
//     print(widget.i_value);
//     print(widget.clientId);
//     print(widget.batchNo);
//     print(MOB_not_EM);
//     String type= MOB_not_EM! ? "mobile" :"email"; 
//     token = await createAlbum56(
//         widget.i_value.toString(), ID!, widget.clientId, widget.batchNo,File(myFuture.toString()),LOCATION,widget.link,type);
//     print(token?.message);
//     return token;
//   }

//  Future<dynamic> _upload() async {
//             if (file== null) return;
//             String fileName = file.path!.split('/').last;
//            FormData formData = new FormData.fromMap({
//   "name": hospitalNameEng,
//   "Services": servicejson,
//   "Image": {
//       "image": await MultipartFile.fromFile(imageFile.path,
//           filename: imageFileName, contentType: new MediaType('image', 'png')),
//       "type": "image/png"
//   },
// });
//            return await Dio()
//         .post("https://7fd2-61-1-116-149.in.ngrok.io/customer/claim-product",data:formData).
//     then((dynamic result){
//     print(result.toString());
// });
// }
List<NGOLIST> Ngolist=[];
getData() async {
  print("not added");
  await FirebaseFirestore.instance.collection("NGO").doc(widget.link).get().then((documentSnapshot) 


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
       temp_class.details["NGORating1"]=data["NGO_Rating"]["1"];
       temp_class.details["NGORating2"]=data["NGO_Rating"]["2"];
       temp_class.details["NGORating3"]=data["NGO_Rating"]["3"];
       temp_class.details["NGORating4"]=data["NGO_Rating"]["4"];
       temp_class.details["NGORating5"]=data["NGO_Rating"]["5"];
      
      
      temp_class.details["NGOPrivateKey"]=data["NGO_PrivateKey"];

      temp_class.details["NGOUserId"]=widget.link;
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
final pdf = pw.Document();
// createPDF() async {
//     for (var img in imageFileList!) {
//       final image = pw.MemoryImage(img.readAsBytesSync());

//       pdf.addPage(pw.Page(
//           pageFormat: PdfPageFormat.a4,
//           build: (pw.Context contex) {
//             return pw.Center(child: pw.Image(image));
//           }));
//     }
//   }
  
  //  savePDF() async {
  //   // await FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  // }

  
      
      final ImagePicker imagePicker = ImagePicker();
      List<File>? imageFileList = [];

      Future<String?> selectImages() async {
         final PickedFile? selectedImages = (await 
                // ignore: deprecated_member_use
                imagePicker.getImage(source: ImageSource.gallery));
         File selected = File(selectedImages!.path);
              imageFileList!.add(selected);
           
          print("Image List Length:" + imageFileList!.length.toString());
          // final file = imageFileList!.first;
          setState((){
            
          });
          return imageFileList!.first.path;
      }
 late firebase_storage.Reference ref;
 late DocumentReference imgRef;
Future uploadImageFile() async {
    int index=1;

    for (var img in imageFileList!) {
      // setState(() {
      //   val = i / _image.length;
      // });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          imgRef.set({'imageurl':{"image"+index.toString(): value},
                      'NGO_Desc':_Comment.text
          
          
          
          
          }, SetOptions(merge: true));
          index++;
        });
      });
      getData();
    }
  } 
//image uploader
    var filepath;
String my='nofile';
     var _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Future<String> _calculation() async => Future<String>.delayed(
  //       const Duration(),
  //       () => 'Loaded',
  //     );

  // Future<void> getData() async {
  //   var a = await _pickFile().timeout(
  //     const Duration(),
  //     onTimeout: () => 'Error',
  //   );

  //   setState(() {
  //     myFuture = a;
  //   });
 bool loading=false;
 String? Filename;
 String? myFuture="";
 List< PlatformFile> file=[];
//  Future<List?> _pickFile() async {
	
// 	// opens storage to pick files and the picked file or files
// 	// are assigned into result and if no file is chosen result is null.
// 	// you can also toggle "allowMultiple" true or false depending on your need
// 	final result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['png','jpg','jpeg']);

// 	// if no file is picked


// 	// we get the file from result object
//   if(result == null)
//   {
//     return null;
//   }
// 	  file = result.files;
//    setState(() {
//                 // Filename=file.name;
//               });
//       return file.path;
// 	// _openFile(file);
// }
 void initState() {
    super.initState();

    // ()async{
    //   await getData();
    //   setState(() {
    //   print("setstate calledd");
    //   // print(searchItems);
    //   // getData();
    // });
    // }();
    imgRef = FirebaseFirestore.instance.collection('NGO').doc(widget.link);
  }

bool sub_visibility = false;
  @override 
   Container poweredby(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(width: MediaQuery.of(context).size.width*0.28,),
            Text(
              "Powered By",
              style: TextStyle(
                  color: Color(0xff002060),
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontFamily: "Poppins Medium"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.008,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Image.asset(
                'assets/veots_logo.png',
                height: 30,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ),
          ]),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.all(40),]
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/50,),
        //     Container(
        //       // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30, bottom: MediaQuery.of(context).size.height/20),
        //       // margin: EdgeInsets.only(top: 0),
        //       // color: Colors.red,
        //       child: Row(
        //         children: [
        //           Container(
        //             // color: Colors.yellow,
        //             // alignment: Alignment.bottomRight,
        //             height:MediaQuery.of(context).size.width * 0.08,
        //               width: MediaQuery.of(context).size.width * 0.08,
        //             child: IconButton(
        //               onPressed: () {
        //                 // Navigator.of(context).pushAndRemoveUntil(
        //                 //   MaterialPageRoute(
        //                 //       builder: ((context) => HomeScreen(
        //                 //             first_time: 0,
        //                 //           ))),
        //                 //   (Route<dynamic> route) => false,
        //                 // );
        //                 Navigator.pop(context);
        //               },
        //               icon: Icon(
        //                 Icons.arrow_back_ios_new,
        //                 color: Color(0xff002060),
        //                 size: MediaQuery.of(context).size.width * 0.04,
        //               )),),
                  
        //           // SizedBox(
        //           //   width: MediaQuery.of(context).size.width/15,
        //           // ),
                  
        //           Container(
        //             // color: Colors.red,
        //             child: Image.asset(
        //               'assets/veots_logo_wo_tl.png',
        //               height: MediaQuery.of(context).size.width * 0.08,
        //               width: MediaQuery.of(context).size.width * 0.15,
        //             ),
        //           ),
                  
        //           Spacer(),
        //           // SizedBox(
        //           //   width: MediaQuery.of(context).size.width * 0.45,
        //           // ),
        //           Container(
        //               height: MediaQuery.of(context).size.width * 0.08,
        //               width: MediaQuery.of(context).size.width * 0.08,
        //               decoration: BoxDecoration(
        //                 color: Color(0xff002060),
        //                 borderRadius: BorderRadius.all(Radius.circular(5)),
        //               ),
        //               child: Center(
        //                 child: FittedBox(
        //                     child: IconButton(
        //                         onPressed: ()
        //                          {
        //                           // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: 
        //                           //  (context)=>HomeScreen(first_time: 0,
        //                           //  mainLink: '',location_on: true,)), (route) => false);
        //                         },
        //                         icon: Icon(
        //                           Icons.home,
        //                           // size: MediaQuery.of(context).size.width * 0.06,
        //                           color: Colors.white,
        //                         ))),
        //               )),
        //           SizedBox(
        //             width: MediaQuery.of(context).size.width * 0.015,
        //           ),
        //          Not_icon(),
        //           SizedBox(
        //             width: MediaQuery.of(context).size.width * 0.015,
        //           ),
        //           Container(
        //                   height: MediaQuery.of(context).size.width * 0.08,
        //                   width: MediaQuery.of(context).size.width * 0.08,
        //                   decoration: BoxDecoration(
        //                     color: Color(0xff002060),
        //                     borderRadius: BorderRadius.all(Radius.circular(5)),
        //                   ),
        //                   child: Center(
        //                     child: FittedBox(
        //                       child: 
        //                       InkWell(
        //                      onTap: (){
        //                 _scaffoldKey.currentState?.openDrawer();    },
        //                        child: Icon(
        //                           Icons.menu,
        //                           size: MediaQuery.of(context).size.width * 0.05,
        //                           color: Colors.white,
        //                         ),
                            
        // ),
        //                     ),
        //                   )),
        //           SizedBox(width: 12,)
        //         ],
        //       ),
        //     ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Text(
              "Upload your photos",
              style: TextStyle(
                  color: Color(0xff011f5f),
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  // fontWeight: FontWeight.bold
                  ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            future_builder(),
            
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),
           Container(
            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width * 0.8,
                            // padding: EdgeInsets.all(15),
                           decoration: BoxDecoration(
                        // border: Border.all(color: logborder),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffdfdfdf),
                        
                      ),
                      child: TextFormField(
                        controller: _Comment,
          minLines: 6,
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          decoration:  InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 10,
                                                              top:5),
                                                      border: InputBorder.none,
                                                      labelText: "Enter Description",
                                                      labelStyle: TextStyle(fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 9,
                                  color: Color(0xff003274)
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                                    ),
      ),
           ),
           SizedBox(height: MediaQuery.of(context).size.height/80,),
          //  Container(
          //   width: MediaQuery.of(context).size.width * 0.8,
          //   child:Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Container(
          //     child: loading==false?
          //      Container(
          //     height: MediaQuery.of(context).size.height / 24,
          //       width: MediaQuery.of(context).size.width * 0.32,
          //       decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //               colors: [
          //                               Color(0xff002060),
          //                               Color(0xffaa2aae)
          //                             ])),
          //       child: ElevatedButton(
          //         onPressed: () async {
                   
          //         },
          //         style: ElevatedButton.styleFrom(
          //             primary: Colors.transparent,
          //             shadowColor: Colors.transparent),
          //         child: Text(
          //           'Submit',
          //           style: TextStyle(fontWeight: FontWeight.bold,
          //           fontFamily: "Poppins Medium",
          //           fontSize: 10,
          //           ),
          //         ),
          //       ),
          //     ):CircularProgressIndicator()
          //    )
          //     ],

          //   ) ,
          //  ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
              "File name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.023,
                  // fontWeight: FontWeight.bold
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/80,),
            Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: EdgeInsets.all(15),
                           decoration: BoxDecoration(
                        // border: Border.all(color: logborder),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffdfdfdf),
                      ),
                            
                                child: 
                                    Text( Filename==null?
                                  'Attach your photos':'${Filename}',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 9,
                                  color: Color(0xff003274)
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                 softWrap: false,
                                 maxLines: 1,
                                 overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          
                          SizedBox(height: MediaQuery.of(context).size.height/80,),
                      Container(
                            height: MediaQuery.of(context).size.height / 17,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                              onPressed: () async{
                                 myFuture= (await selectImages()) ;
                                setState(() {
                                  print(myFuture);
                                  print(myFuture.toString());
                                  if (myFuture==null)
                                  {
                                    sub_visibility = false;
                                    Filename = null;
                                    my='nofile';
                                  }
                                  else{
                                    my='hasfile';
                                    sub_visibility = true;
                                  }
                                });
                                
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                                  primary: Color(0xff01b050)),
                              child: FittedBox(
                                child: 
                                    Text(
                                  'UPLOAD',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 14,
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                              ),
                            ),
                          ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/60,),
            sub_visibility == false ?
            Container(
                // alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*0.678,
                child: Text("Upload the images for the NGO",style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.023,
                  fontFamily: "Poppins Medium"
                ),textAlign: TextAlign.center,),
              ) 
              :
                 Container(
                  child: 
                   Container(
                                      height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xff00b7ff), Color(0xffaa2aae)])),
                            child: ElevatedButton(
                              onPressed: () async{
                                // setState(() {
                                //   loading=true;
                                // });
                                // _upload();
                                uploadImageFile();
                                print(File(myFuture.toString()));
                                // createPDF();
                                // savePDF();
                                
//                                Future.delayed(const Duration(milliseconds: 5000), () {

// // Here you can write your code

//   setState(() {
//     // Here you can write your code for open new view
    
//     // proceed=true;
//     print(proceed);
    
//   });

// });
Future.delayed(const Duration(milliseconds: 5000), () {

// Here you can write your code

  
    
   Navigator.of(context).pushReplacement(MaterialPageRoute(
                                             builder: (context) => DetailPage2(Snapshot: Ngolist.first,)
                                           ));
                                // await   getData();

    // Here you can write your code for open new view
  

});
                    if (true) {
                      setState(() {
                                  loading=false;
                                });
              //         showDialog(
                           
              //             barrierDismissible: false,
              //             context: context,
              //             builder: (context) {
              //             return WillPopScope(
              //            onWillPop: () async => false,
              //            child:AlertDialog(   
              //                 backgroundColor: Color(0xff002060),
              //                 titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 6),
              //                 shape: RoundedRectangleBorder(
              //                     //<-- SEE HERE
              //                     // side: BorderSide(
              //                     //   color: Colors.greenAccent,
              //                     // ),
              //                     borderRadius: BorderRadius.only(
              //                         bottomLeft: Radius.circular(10),
              //                         bottomRight: Radius.circular(10))),
              //                 title: Stack(
              //                   children: [
              //                     Container(
              //                         height:
              //                               50,
              //                         width: MediaQuery.of(context).size.width,
              //                         decoration: BoxDecoration(
              //                             gradient: LinearGradient(colors: [
              //                           Color(0xff003296),
              //                           Color(0xff662da4)
              //                         ])),
              //                         // color: Colors.blue,
              //                         child: Column(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           children: [
              //                             if (MediaQuery.of(context)
              //                                     .size
              //                                     .width <
              //                                 600) ...[
              //                               Text(
              //                                 "Registration",
              //                                 textAlign: TextAlign.center,
              //                                 style: TextStyle(
              //                                     color: Colors.white,
              //                                     fontWeight: FontWeight.w400,
              //                                     fontSize: 20),
              //                               ),
              //                             ] else
              //                               Text(
              //                                 "Registration",
              //                                 textAlign: TextAlign.center,
              //                                 style: TextStyle(
              //                                     color: Colors.white,
              //                                     fontWeight: FontWeight.w400,
              //                                     fontSize: 30),
              //                               ),
              //                           ],
              //                         )),
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.end,
              //                       children: [
              //                         IconButton(
              //                           onPressed: (()
              //                            {
              //                             // Navigator.of(context).push(MaterialPageRoute(
              //                             //    builder: (context) => Warranty(warrantyPeriod: widget.warrantyPeriod, Pimage: widget.Pimage , prodName: widget.prodName, cashBackPts: widget.cashBackPts, cashBackApp: widget.cashBackApp,)
              //                             //  ));
                                       

              //                           }
              //                           ),
              //                           icon: Icon(
              //                             Icons.close,
              //                             color: Colors.white,
              //                           ),
              //                           iconSize: 20,
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //                 content:Container(
              //                   height: 100,
              //                   child: Column(
                                  
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: [
              //                    Text(
              //                   'Product Registered to you Successfully',
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize:
              //                           MediaQuery.of(context).size.width *
              //                               0.05),
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                   children: [
              //                      Container(
              // height: MediaQuery.of(context).size.height / 24,
              //   width: MediaQuery.of(context).size.width /4.5,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [
              //                          Color(0xff00b7ff), Color(0xffaa2aae)
              //                         ])),
              //   child: ElevatedButton(
              //     onPressed: () async {
                   
              //     },
              //     style: ElevatedButton.styleFrom(
              //         primary: Colors.transparent,
              //         shadowColor: Colors.transparent),
              //     child: Text(
              //       'Yes',
              //       style: TextStyle(fontWeight: FontWeight.bold,
              //       fontFamily: "Poppins Medium",
              //       fontSize: 8,
              //       ),
              //     ),
              //   ),
              // ),
              //  Container(
              // height: MediaQuery.of(context).size.height / 24,
              //   width: MediaQuery.of(context).size.width /4.5,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [
              //                           Color(0xff00b7ff), Color(0xffaa2aae)
              //                         ])),
              //   child: ElevatedButton(
              //     onPressed: () async {
                   
              //     },
              //     style: ElevatedButton.styleFrom(
              //         primary: Colors.transparent,
              //         shadowColor: Colors.transparent),
              //     child: Text(
              //       'No',
              //       style: TextStyle(fontWeight: FontWeight.bold,
              //       fontFamily: "Poppins Medium",
              //       fontSize: 8,
              //       ),
              //     ),
              //   ),
              // )

              //                   ],
              //                 )
              //                 ],),
              //                 )
              //               )
              //               );
              //             });
                    } 
                    
                  
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              child: FittedBox(
                                child: 
                                    Text(
                                  'Submit',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins Medium",
                                  fontSize: 13.5,
                                  // fontSize: MediaQuery.of(context).size.width*0.030
                                  ),
                                ),
                              ),
                            ),
                          )
                 ),
                  SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              //    Container(
              // child: loading==false?
              //  Container(
              // height: MediaQuery.of(context).size.height / 14,
              //   width: MediaQuery.of(context).size.width * 0.5,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [
              //                           Color(0xff002060),
              //                           Color(0xffaa2aae)
              //                         ])),
              //   child: ElevatedButton(
              //     onPressed: () async {
                   
              //     },
              //     style: ElevatedButton.styleFrom(
              //         primary: Colors.transparent,
              //         shadowColor: Colors.transparent),
              //     child: Text(
              //       'Report',
              //       style: TextStyle(fontWeight: FontWeight.bold,
              //       fontFamily: "Poppins Medium",
              //       fontSize: 13.6,
              //       ),
              //     ),
              //   ),
              // ):CircularProgressIndicator()
            //  )
          ],
        ),
        )
      ),
      // bottomNavigationBar: poweredby(context),
      // drawer: HamWidget()
    )
    );
  }
  Widget future_builder(){
return FutureBuilder(
  //  future: myFuture,
  builder: (context, snapshot) {
 if (my=='nofile'){

    return Container(
              color: Color(0xff00b7ff),
              height: 300,
              width: 250,
             
            );

  }
   else if(my=='hasfile')
  { print("hello");
      return   Container(
        width:300,
        height: 250,
        child: GridView.builder(
                        itemCount: imageFileList!.length,
                       gridDelegate: 
                          SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 2,crossAxisSpacing: 2,
                              crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                           return Image.file(File(imageFileList![index].path), 
                        fit: BoxFit.cover,);
                     }),
        // child: Center(child: Image.file(File(myFuture.toString()), )),
      );
  }

else {
   return Container(
              color: Color(0xff00b7ff),
              height: 300,
              width: 250,
            
            );
}

});
  }
  }
// class FileHandleApi {
//   // save pdf file function
//   static Future<File> saveDocument({
//     required String name,
//     required pw.Document pdf,
//   }) async {
//     final bytes = await pdf.save();

//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');
//     await file.writeAsBytes(bytes);
//     return file;
//   }

//   // open pdf file function
//   static Future openFile(File file) async {
//     final url = file.path;

//     await OpenFile.open(url);
//   }
// }