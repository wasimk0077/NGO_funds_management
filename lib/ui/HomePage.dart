// import 'dart:io';
// // import 'package:dio/dio.dart';
// // import 'package:Veots/screens/constants.dart';
// // import 'package:Veots/widgets/not_icon.dart';
// // import 'package:Veots/widgets/send_accept.dart';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:beta_app/ui/HomeView.dart';
// // import 'package:beta_app/ui/life_meaning_model.dart';
// import 'package:beta_app/ui/NgoList.dart';
// import 'package:beta_app/ui/life_meaning_model.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:pdf_render/pdf_render_widgets.dart';
// import 'package:path/path.dart' as Path;

// // import 'package:Veots/screens/warranty.dart';
// // import 'package:Veots/widgets/ham.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // import 'Notifications_view.dart';
// // import 'home_page.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:provider/provider.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:web_socket_channel/io.dart';
// // import 'package:open_file/open_file.dart';
// // import 'package:badges/badges.dart' as badges;

// class HomePage extends StatefulWidget {
//   const HomePage({
//     super.key,
//   });
// // final String link;

//   @override
//   State<HomePage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<HomePage> {
// //   final ImagePicker imgpicker = ImagePicker();
// // List<XFile>? imagefiles;

// //   openImages() async {
// // try {
// //     var pickedfiles = await imgpicker.pickMultiImage();
// //     //you can use ImageCourse.camera for Camera capture
// //     if(pickedfiles != null){
// //         imagefiles = pickedfiles;
// //         setState(() {
// //         });
// //     }else{
// //         print("No image is selected.");
// //     }
// // }catch (e) {
// //     print("error while picking file.");
// // }
// //   }
//   TextEditingController _input = TextEditingController();
// // Album3? token;
// //   Future getData() async {

// //     print(widget.i_value);
// //     print(widget.clientId);
// //     print(widget.batchNo);
// //     print(MOB_not_EM);
// //     String type= MOB_not_EM! ? "mobile" :"email";
// //     token = await createAlbum56(
// //         widget.i_value.toString(), ID!, widget.clientId, widget.batchNo,File(myFuture.toString()),LOCATION,widget.link,type);
// //     print(token?.message);
// //     return token;
// //   }

// //  Future<dynamic> _upload() async {
// //             if (file== null) return;
// //             String fileName = file.path!.split('/').last;
// //            FormData formData = new FormData.fromMap({
// //   "name": hospitalNameEng,
// //   "Services": servicejson,
// //   "Image": {
// //       "image": await MultipartFile.fromFile(imageFile.path,
// //           filename: imageFileName, contentType: new MediaType('image', 'png')),
// //       "type": "image/png"
// //   },
// // });
// //            return await Dio()
// //         .post("https://7fd2-61-1-116-149.in.ngrok.io/customer/claim-product",data:formData).
// //     then((dynamic result){
// //     print(result.toString());
// // });
// // }

//   final pdf = pw.Document();
// // createPDF() async {
// //     for (var img in imageFileList!) {
// //       final image = pw.MemoryImage(img.readAsBytesSync());

// //       pdf.addPage(pw.Page(
// //           pageFormat: PdfPageFormat.a4,
// //           build: (pw.Context contex) {
// //             return pw.Center(child: pw.Image(image));
// //           }));
// //     }
// //   }

//   //  savePDF() async {
//   //   // await FileHandleApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
//   // }

//   final ImagePicker imagePicker = ImagePicker();
//   List<File>? imageFileList = [];

//   Future<String?> selectImages() async {
//     final PickedFile? selectedImages = (await
//         // ignore: deprecated_member_use
//         imagePicker.getImage(source: ImageSource.gallery));
//     File selected = File(selectedImages!.path);
//     imageFileList!.add(selected);

//     print("Image List Length:" + imageFileList!.length.toString());
//     // final file = imageFileList!.first;
//     setState(() {});
//     return imageFileList!.first.path;
//   }

//   late firebase_storage.Reference ref;
//   // late DocumentReference imgRef;
//   // Future uploadImageFile() async {
//   //   int index = 1;

//   //   for (var img in imageFileList!) {
//   //     // setState(() {
//   //     //   val = i / _image.length;
//   //     // });
//   //     ref = firebase_storage.FirebaseStorage.instance
//   //         .ref()
//   //         .child('images/${Path.basename(img.path)}');
//   //     await ref.putFile(img).whenComplete(() async {
//   //       await ref.getDownloadURL().then((value) {
//   //         imgRef.set({
//   //           'imageurl': {"image" + index.toString(): value},
//   //           'NGO_Desc': _Comment.text
//   //         }, SetOptions(merge: true));
//   //         index++;
//   //       });
//   //     });
//   //   }
//   // }

// //image uploader
//   var filepath;
//   String my = 'nofile';
//   var _scaffoldKey = new GlobalKey<ScaffoldState>();

//   // Future<String> _calculation() async => Future<String>.delayed(
//   //       const Duration(),
//   //       () => 'Loaded',
//   //     );

//   // Future<void> getData() async {
//   //   var a = await _pickFile().timeout(
//   //     const Duration(),
//   //     onTimeout: () => 'Error',
//   //   );

//   //   setState(() {
//   //     myFuture = a;
//   //   });
//   bool loading = false;
//   String? Filename;
//   String? myFuture = "";
//   List<PlatformFile> file = [];
// //  Future<List?> _pickFile() async {

// // 	// opens storage to pick files and the picked file or files
// // 	// are assigned into result and if no file is chosen result is null.
// // 	// you can also toggle "allowMultiple" true or false depending on your need
// // 	final result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ['png','jpg','jpeg']);

// // 	// if no file is picked

// // 	// we get the file from result object
// //   if(result == null)
// //   {
// //     return null;
// //   }
// // 	  file = result.files;
// //    setState(() {
// //                 // Filename=file.name;
// //               });
// //       return file.path;
// // 	// _openFile(file);
// // }

// String rpcUrl="http://192.168.1.10:7545";
// String wsUrl="ws://192.168.1.10:7545/";

// void sendEther()async{
//    Web3Client client=Web3Client(rpcUrl,Client(),socketConnector: (){
//     return IOWebSocketChannel.connect(wsUrl).cast<String>();
   
//    });
//     String privatekey="0xb004912d2ef25e3f78b079d6e2ae22cbc9ce4d527fc89cbe99cd9ffcb5ed2add";
//     Credentials credentials= await client.credentialsFromPrivateKey(privatekey);

//     EthereumAddress ownAddress=await credentials.extractAddress();
//     EthereumAddress sendAddress=EthereumAddress.fromHex("0xE35796927DCc49e4521cF8298Df51195180E691B");
//     print(ownAddress);

//     await client.sendTransaction(credentials,Transaction(from: ownAddress,to: sendAddress,value:EtherAmount.fromUnitAndValue(EtherUnit.wei, 20) ));
// print(
//   "121212"
// );

// }


//   void initState() {
//     super.initState();
//     // imgRef = FirebaseFirestore.instance.collection('NGO').doc(widget.link);
//   }

//   bool sub_visibility = false;
//   @override
//   Container poweredby(BuildContext context) {
//     return Container(
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // SizedBox(width: MediaQuery.of(context).size.width*0.28,),
//             Text(
//               "Powered By",
//               style: TextStyle(
//                   color: Color(0xff002060),
//                   fontSize: MediaQuery.of(context).size.width * 0.03,
//                   fontFamily: "Poppins Medium"),
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.008,
//             ),
//             Container(
//               margin: EdgeInsets.only(bottom: 5),
//               child: Image.asset(
//                 'assets/veots_logo.png',
//                 height: 30,
//                 width: MediaQuery.of(context).size.width * 0.2,
//               ),
//             ),
//           ]),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final lifeMeaningProvider = Provider.of<LifeMeaningModel>(context);
//     return Scaffold(
      
//       body: 
     
//         Center(
//           child: 
//               // ? CircularProgressIndicator()
//               Column(
//                 mainAxisAlignment:MainAxisAlignment.center ,
//                 children: [
//                   // Text(" The cuurent meaning of liefe is "+lifeMeaningModel.lifeMeaning.toString()),
                
//                  SizedBox(
//                   width: 200,
//             child:       TextFormField(

//                     controller:_input ,
//                     decoration: InputDecoration(labelText: "What is the meaning of life is"),
//                   ),
//                 ),
//                 TextButton(onPressed: (){
//                   sendEther();
//                 }, child: Text("adasdd"))
//                 ],
//               )
              
//         )
      
//     );
//   }

//   Widget future_builder() {
//     return FutureBuilder(
//         //  future: myFuture,
//         builder: (context, snapshot) {
//       if (my == 'nofile') {
//         return Container(
//           color: Color(0xff00b7ff),
//           height: 300,
//           width: 250,
//         );
//       } else if (my == 'hasfile') {
//         print("hello");
//         return Container(
//           width: 300,
//           height: 250,
//           child: GridView.builder(
//               itemCount: imageFileList!.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 3),
//               itemBuilder: (BuildContext context, int index) {
//                 return Image.file(
//                   File(imageFileList![index].path),
//                   fit: BoxFit.cover,
//                 );
//               }),
//           // child: Center(child: Image.file(File(myFuture.toString()), )),
//         );
//       } else {
//         return Container(
//           color: Color(0xff00b7ff),
//           height: 300,
//           width: 250,
//         );
//       }
//     });
//   }
// }
// // class FileHandleApi {
// //   // save pdf file function
// //   static Future<File> saveDocument({
// //     required String name,
// //     required pw.Document pdf,
// //   }) async {
// //     final bytes = await pdf.save();

// //     final dir = await getApplicationDocumentsDirectory();
// //     final file = File('${dir.path}/$name');
// //     await file.writeAsBytes(bytes);
// //     return file;
// //   }

// //   // open pdf file function
// //   static Future openFile(File file) async {
// //     final url = file.path;

// //     await OpenFile.open(url);
// //   }
// // }
