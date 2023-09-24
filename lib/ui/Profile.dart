// // import 'package:Veots/screens/login.dart';
// // import 'package:Veots/widgets/ham.dart';
// // import 'package:Veots/widgets/send_accept.dart';
// import 'package:flutter/material.dart';
// // import 'package:Veots/screens/constants.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import '../widgets/NetworkCheck.dart';
// // import 'home_page.dart';


// class Profile_new extends StatefulWidget {
//   const Profile_new({super.key});
  
//   @override
//   State<Profile_new> createState() => _Profile_newState();
// }
// // var _scaffoldKey = new GlobalKey<ScaffoldState>();
// class _Profile_newState extends State<Profile_new> {
//    var _scaffoldKey = new GlobalKey<ScaffoldState>();
//    var _editKey = new GlobalKey<ScaffoldState>();
// final name_control =TextEditingController();
// final id_control =TextEditingController();
// final password = TextEditingController();
// final confirm_password = TextEditingController();
// final edit_password = TextEditingController();
// final companyName = TextEditingController();
// bool loading_update=false;
// Color text_color_id=Color(0xff4d4c4c);
// Color text_color_pass=Color(0xff4d4c4c);
// Color text_color_conpass=Color(0xff4d4c4c);


// bool pass=true;
// bool confirm_pass=true;
// // String dropdownvalue = GENDER.toString();   
// bool update_button=true;
// bool edit=true;
// final formkey= GlobalKey<FormState>();

//   // List of items in our dropdown menu
//   var items = [    
//     'Male',
//     'Female',
//     'Others'
//   ];
//   @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   id_control.text=ID.toString();
//   //   name_control.text=NAME.toString();
//   //   print(COMNAME.toString());
//   //   companyName.text= COMNAME==null ?'': COMNAME.toString();
//   // }
//   @override
  
//   Widget build(BuildContext context) {
//     return SafeArea(
//      child: WillPopScope(
//           onWillPop: () async {
//             Navigator.of(context).pop();
//             return true;
//           },
//       child:
//         Scaffold(
//             key: _scaffoldKey,
//           backgroundColor: Colors.white,
//           body: SingleChildScrollView(
//             child: Form(
//               key: formkey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children:
//                  [
                 
//                   const SizedBox(height: 20,),
                    
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 30,
//                     ),
//                   Center(
//                     child: Column(
                    
//                       children: [
//                         Text(
//                           "Profile",
//                           style: TextStyle(
                           
//                             fontSize: MediaQuery.of(context).size.width * 0.0317,
//                             fontFamily: "Poppins Medium",
//                             // height: 1.2,
//                           ),
//                         ),
//                          Icon(
                                    
//                             Icons.account_circle,
//                             size: MediaQuery.of(context).size.width*0.3,
//                             // color: Colors.white,
//                            ),
//                       Text(
//                           "NAME.toString()",
//                           style: TextStyle(
//                             fontSize: MediaQuery.of(context).size.width * 0.041,
//                             fontFamily: "Poppins Medium",
//                             color: Color(0xff002060),
//                             // height: 1.2,
//                           ),
//                         ),
                       
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           margin:EdgeInsets.only(left: 50,right: 50),
                         
//                           height: 25,
//                           width: 60,
//                           child: 
//                           ElevatedButton(
//                             onPressed: (){
                            
//                               setState(() {
//                                 edit=false;
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.transparent,
//                               // shadowColor: Colors.transparent
//                             ), 
//                             child: Text("Edit")
//                             ),
//                             decoration: const BoxDecoration(
//                                           gradient: LinearGradient(
//                                           colors: [Color(0xff00b7ff), Color(0xffaa2aae)]))
//                             ),
//                       ],
//                     ),
//                     SizedBox(

//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                 Container(
//                   margin:EdgeInsets.only(left: 50,right: 50),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
                      
                              
//                       Text(
//                           "Name",
//                           style: TextStyle(
                           
//                             fontSize: MediaQuery.of(context).size.width * 0.025,
//                             fontFamily: "Poppins Medium",
//                             color: Color(0xff004aad)
//                             // height: 1.2,
//                           ),
//                         ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                     TextFormField( 
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       readOnly: edit,
//                       controller: name_control,
//                        validator: (value){
//                               if (
//                                   value==' '|| value!.isEmpty ) {
                                    
//                                    return  "Can't be null" ;
                               
//                                   }
//                                   else if(value.length<3)
//                                   {
//                                     return 'Username should contain at least 8 characters';
//                                   }
//                                   else{
                                      
//                                     return null;
                                
//                                   }
                           
//                           },
//                       style: TextStyle(
//                           color: Color(0xff4d4c4c),
//                           fontSize: MediaQuery.of(context).size.width * 0.0317),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xfffafafa),
//                         errorStyle: TextStyle(
//                             fontSize:
//                                 MediaQuery.of(context).size.width * 0.03),
//                         contentPadding: EdgeInsets.only(
//                           left: 20
//                         ),
//                         border:OutlineInputBorder(borderSide:BorderSide.none,
//                           borderRadius: BorderRadius.circular(35) ),
                          
//                       ),
                      
                     
//                               ),
                              
//                        SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                       ),
//                       Text(
//                           "Company Name",
//                           style: TextStyle(
                           
//                             fontSize: MediaQuery.of(context).size.width * 0.025,
//                             fontFamily: "Poppins Medium",
//                             color: Color(0xff004aad)
//                             // height: 1.2,
//                           ),
//                         ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                     TextFormField( 
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       readOnly: edit,
//                       controller: companyName,
//                       //  validator: (value){
//                       //          if(value!.length<8 && value.isNotEmpty)
//                       //             {
//                       //               return 'Company Name should contain at least 8 characters';
//                       //             }
//                       //             else{
                                      
//                       //               return null;
                                
//                       //             }
                           
//                       //     },
//                       style: TextStyle(
//                           color: Color(0xff4d4c4c),
//                           fontSize: MediaQuery.of(context).size.width * 0.0317),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xfffafafa),
//                         errorStyle: TextStyle(
//                             fontSize:
//                                 MediaQuery.of(context).size.width * 0.03),
//                         contentPadding: EdgeInsets.only(
//                           left: 20
//                         ),
//                         border:OutlineInputBorder(borderSide:BorderSide.none,
//                           borderRadius: BorderRadius.circular(35) ),
                          
//                       ),
                      
                     
//                               ),
//                             SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                       ),
                    
//                       MOB_not_EM!?
//                        Text(
//                         "Phone",
//                           style: TextStyle(
                           
//                             fontSize: MediaQuery.of(context).size.width * 0.025,
//                             fontFamily: "Poppins Medium",
//                             color: Color(0xff004aad)
//                             // height: 1.2,
//                           ),
//                         ):Text(
//                         "Email",
//                           style: TextStyle(
                           
//                             fontSize: MediaQuery.of(context).size.width * 0.025,
//                             fontFamily: "Poppins Medium",
//                             color: Color(0xff004aad)
//                             // height: 1.2,
//                           ),
//                         ),
//                         SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                     MOB_not_EM! ? 
//                     TextFormField(
//                       controller: id_control,
//                       onChanged: (value) {
//                       RegExp reg = RegExp(r'[0-9]{10}');
//                       RegExp reg1 = RegExp(r'[.,-\s]+');
//                                if ( value==null|| value.isEmpty || value.length<10 || reg1.hasMatch(value)
//                                   ) {
//                                     setState(() {
                            
//                                 text_color_id=Colors.red;
//                               });
//                               }
//                               else{
//                                 setState(() {
//                                 //  check_id=true;
//                                  text_color_id=Color(0xff4d4c4c);
//                               });
                               
//                               }
                            
//                       },
//                       validator: (value){
//                               if (
//                                   value==' ' || value!.isEmpty ) {
                                    
//                                    return  "Phone is required" ;
                               
//                                   }
//                                   else{
                                      
//                                     return null;
                                
//                                   }
                           
//                           },
//                       autovalidateMode:AutovalidateMode.onUserInteraction,
//                       maxLength: 10,
//                       keyboardType: TextInputType.number,
//                       readOnly: true,
                     
//                       style: TextStyle(
//                           color: text_color_id,
//                           fontSize: MediaQuery.of(context).size.width * 0.0317),
//                       decoration: InputDecoration(
                        
//                         counterText: "",
//                         filled: true,
//                         fillColor: Color(0xfffafafa),
//                         errorStyle: TextStyle(
//                             fontSize:
//                                 MediaQuery.of(context).size.width * 0.03),
//                         contentPadding: EdgeInsets.only( top: 0,
//                           left: 20
//                         ),
//                         border:OutlineInputBorder(borderSide:BorderSide.none,
//                           borderRadius: BorderRadius.circular(35)),
                         
//                                 ),

                     
//                               ):
//                       TextFormField( 
                     
//                       validator: (value) {
//                               RegExp reg = RegExp(r'[0-9]{10}');
              
//                               if (value==null|| value.isEmpty){
//                                 return 'Email is required';
//                               }
//                               else if ((
//                                       !value.contains('@') ||
//                                       !value.contains('.')) 
//                                  ) {
//                                 return 'Invalid Email';
//                               }
//                               else{
//                                 return null;
//                               }
//                             },
//                     controller: id_control,
//                    readOnly: true,
                      
//                       style: TextStyle(
//                           color: Color(0xff4d4c4c),
//                           fontSize: MediaQuery.of(context).size.width * 0.0317),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xfffafafa),
//                         errorStyle: TextStyle(
//                             fontSize:
//                                 MediaQuery.of(context).size.width * 0.03),
//                         contentPadding: EdgeInsets.only(
//                           left: 20
//                         ),
//                         border:OutlineInputBorder(borderSide:BorderSide.none,
//                           borderRadius: BorderRadius.circular(35) ),

                         
//                       ),
//                               ),
//                      SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                     Text(
//                         "Gender",
//                           style: TextStyle(
                           
//                             fontSize: MediaQuery.of(context).size.width * 0.025,
//                             fontFamily: "Poppins Medium",
//                             color: Color(0xff004aad)
//                             // height: 1.2,
//                           ),
//                         ),
//                        SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                      Container(
                                            
//                                             height: MediaQuery.of(context).size.height*0.07,
//                                             child:
//                                              DropdownButtonFormField(
                                            
//                                               iconEnabledColor:
//                                                   const Color(0xFFfafafa),
//                                               iconDisabledColor:const Color(0xFFfafafa) ,
//                                               hint: FittedBox(
//                                                 fit: BoxFit.fitHeight,
//                                                 child: Text(
//                                                   "Select",
//                                                   style: TextStyle(
//                                                       color:
//                                                           const Color(0xff4d4c4c),
//                                                       fontFamily:
//                                                           "Poppins Medium",
//                                                       fontSize:
//                                                           MediaQuery.of(context).size.width * 0.0317),
//                                                 ),
//                                               ),
//                                               style: TextStyle(color:
//                                                           const Color(0xff4d4c4c),
//                                                       fontFamily:
//                                                           "Poppins Medium",
//                                               fontSize: MediaQuery.of(context).size.width * 0.031),
                                              
//                                               decoration: InputDecoration(
                                                
//                                                           filled: true,
//                                                           fillColor: Color(0xfffafafa),
//                                                           enabledBorder: OutlineInputBorder(
//                                                                     borderSide: BorderSide(
//                                                                         width: 0,
//                                                                         color: const Color(
//                                                                             0xFFfafafa)),
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(20),
//                                                                   ),
//                                                                   border: OutlineInputBorder(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(25),
//                                                                   ),
                                                      
//                                                           ),
//                                               value: dropdownvalue,
//                                               icon: const Icon(
//                                                 Icons.keyboard_arrow_down,
//                                               ),
//                                               items: items.map((String items) {
//                                                 return DropdownMenuItem(
//                                                   value: items,
//                                                   child: Text(items),
//                                                 );
//                                               }).toList(),
//                                               onChanged: edit? null:
//                                               (String? newValue) {
//                                                 dropdownvalue = newValue!;
//                                                 setState(() {
                                                  
                                             
//                                                 switch (dropdownvalue) {
//                                                   case "Male":
//                                                     print(dropdownvalue);
//                                                     break;
//                                                   case "Female":
//                                                     print(dropdownvalue);
//                                                     break;
//                                                   case "Others":
//                                                     print(dropdownvalue);
//                                                     break;
                                                    
//                                                 }
//                                                    });
//                                               },
//                                             ),
//                                           ),
//               SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                     Text(
//                         "New Password",
//                           style: TextStyle(
                           
//                             fontSize: MediaQuery.of(context).size.width * 0.025,
//                             fontFamily: "Poppins Medium",
//                             color: Color(0xff004aad)
//                             // height: 1.2,
//                           ),
//                         ),
//                       SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                         TextFormField( 

//                       readOnly: edit,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                          validator: (value){
//                               String res='';
//                               RegExp complete=RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
//                               RegExp upper = RegExp(r'(?=.*[A-Z])');
//                               RegExp lower = RegExp(r'(?=.*[a-z])');
//                               RegExp digit = RegExp(r'(?=.*[0-9])');
//                               RegExp special = RegExp(r'(?=.*?[!@#\$&*~])');
//                               if(value!.isNotEmpty){
//                               if (!upper.hasMatch(value))
//                               {
//                                 res=res+'should contain at least one upper case';
//                               }
//                               if(!lower.hasMatch(value))
//                               {
//                                 res=res+'\nshould contain at least one lower case';
//                               }
//                               if(!digit.hasMatch(value))
//                               {
//                                 res=res+'\nshould contain at least one digit';
//                               }
//                               if(!special.hasMatch(value))
//                               {
//                                 res=res+'\nshould contain at least one Special character';
//                               }
//                               if(value.length<8)
//                               {
//                                 res=res+'\nMust be at least 8 characters in length';

//                               }
//                               }

//                               if (!complete.hasMatch(value) && value.isNotEmpty) {
//                                      text_color_pass=Colors.red;
//                                    return  res ;
                               
//                                   }
//                                   else{
//                                       text_color_pass=Color(0xff4d4c4c);
//                                     return null;
                                
//                                   }
                           
//                           },
                          
//                       obscureText: pass,
//                       controller:password ,  
//                       style: TextStyle(
//                           color: text_color_pass,
//                           fontSize: MediaQuery.of(context).size.width * 0.0317),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xfffafafa),
//                         errorStyle: TextStyle(
//                             fontSize:
//                                 MediaQuery.of(context).size.width * 0.03),
//                         contentPadding: EdgeInsets.only(
//                           left: 20
//                         ),
//                         border:OutlineInputBorder(borderSide:BorderSide.none,
//                           borderRadius: BorderRadius.circular(35) ),
//                           suffixIcon: edit==false?IconButton(
                                        
//                                         // padding: EdgeInsets.only(
//                                         //     top: MediaQuery.of(context).size.height *
//                                         //         0.01),
//                                         iconSize:
//                                             MediaQuery.of(context).size.width * 0.04,
//                                         icon: Icon(
//                                           color: Color(0xff4d4c4c),
//                                           pass
//                                               ? Icons.visibility_off
//                                               : Icons.visibility,
                            
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             pass = !pass;
//                                           });
//                                         },
//                                       ):null,
//                       ),
//                               ),
//                   SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                     Text(
//                         "Confirm Password",
//                           style: TextStyle(
                           
//                             fontSize: MediaQuery.of(context).size.width * 0.025,
//                             fontFamily: "Poppins Medium",
//                             color: Color(0xff004aad)
//                             // height: 1.2,
//                           ),
//                         ),
//                       SizedBox(
//                       height: MediaQuery.of(context).size.height / 130,
//                     ),
//                         TextFormField( 
//                           readOnly: edit,
                         
//                           validator:  (value) {
//                               if (password.text ==confirm_password.text 
//                                  ) {
//                                      text_color_conpass=Color(0xff4d4c4c);
//                                      return null;
//                                   }
//                                   else {
//                                     text_color_conpass=Colors.red;
//                                     return 'Should be same as the above password';
//                                   }
//                           },
//                       obscureText: confirm_pass,
//                       controller: confirm_password,
//                       style: TextStyle(
//                           color: text_color_conpass,
//                           fontSize: MediaQuery.of(context).size.width * 0.0317),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xfffafafa),
//                         errorStyle: TextStyle(
//                             fontSize:
//                                 MediaQuery.of(context).size.width * 0.03),
//                         contentPadding: EdgeInsets.only(
//                           left: 20
//                         ),
//                         border:OutlineInputBorder(borderSide:BorderSide.none,
//                           borderRadius: BorderRadius.circular(35) ),
//                           suffixIcon: edit==false?IconButton(
                                        
//                                         // padding: EdgeInsets.only(
//                                         //     top: MediaQuery.of(context).size.height *
//                                         //         0.01),
//                                         iconSize:
//                                             MediaQuery.of(context).size.width * 0.04,
//                                         icon: Icon(
//                                           color: Color(0xff4d4c4c),
//                                           confirm_pass
//                                               ? Icons.visibility_off
//                                               : Icons.visibility,
                            
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             confirm_pass = !confirm_pass;
//                                           });
//                                         },
//                                       ):null,
//                       ),
//                               ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 50,
//                     ),
//                     Row(
//                       children: [
//                        Container(
//                                             child :ElevatedButton(
//                                                 onPressed: (() async{  
                                                 
//                                                     print("Reset");
//                                                     setState(() {

//                                                     name_control.text=NAME.toString();
//                                                     id_control.text=ID.toString();
//                                                    dropdownvalue=GENDER.toString();
//                                                     confirm_password.text='';
//                                                     password.text='';
//                                                     edit=true;
//                                                     companyName.text= COMNAME==null ?'': COMNAME.toString();
                                                    
//                                                  });
                                                 
                                                     
                                                  
//                                                 }),
//                                                 child: Text("Cancel"),
//                                                 style: const ButtonStyle(
//                                                   backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
//                                                 ) ),
//                                             height:
//                                               45,
//                                             width: MediaQuery.of(context).size.width/3,
//                                             decoration: const BoxDecoration(
//                                        gradient: LinearGradient(
//                                           colors: [Color(0xff00b7ff), Color(0xffaa2aae)]))
//                                             ),
//                                             Spacer(),
//                                             loading_update?
//                                             CircularProgressIndicator():
//                                             Container(
//                                             child :ElevatedButton(
//                                                 onPressed: (edit==false)?(() async{ 
//                                                   if(formkey.currentState!.validate()){
//                                                   show(); 
//                                                   }
                                                  
//                                                 }):null,
//                                                 child: Text("Update"),
//                                                 style: const ButtonStyle(
//                                                   backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
//                                                 ) 
//                                                 )

//                                                 ,
//                                             height:
//                                               45,
//                                             width: MediaQuery.of(context).size.width/3,
//                                             decoration: (update_button&& edit==false) ?const BoxDecoration(
//                                        gradient: LinearGradient(
//                                           colors: [Color(0xff00b7ff), Color(0xffaa2aae)])
//                                           ):  BoxDecoration(
//                                                   // color: Colors.white,
//                                                   border: Border.all(
//                                                     color: Colors.grey,
//                                                     width: 2,
//                                                   ),
//                                             )
//                                             )
               
                        
//                       ],
//                     ),
//                       SizedBox(
//                       height: MediaQuery.of(context).size.height / 40,
//                     ),                               
//                     ],
//                   ),
//                 )
//                 ]
//                 ,),
//             ),
//           ),
//             drawer:  HamWidget()
//           )
//            )
//     );
//   }
//   show()
//   {
//     return showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               backgroundColor: Colors.white,
//                 // backgroundColor: Colors.greenAccent,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(20))
//       ) ,
//       title: Text('Enter current password',
//       style: TextStyle(fontWeight: FontWeight.bold),),
//       content: TextFormField(
//         controller:edit_password ,
//         decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xfffafafa),
//                         errorStyle: TextStyle(
//                             fontSize:
//                                 MediaQuery.of(context).size.width * 0.03),
//                         contentPadding: EdgeInsets.only(
//                           left: 20
//                         ),
//                         border:OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20) ),)
//       ),
//       actions: [
//         TextButton(
//           onPressed: () async{
           
//           if(formkey.currentState!.validate())
//                         {

//                           print(name_control.text);
//                           print(id_control.text);
//                           print(dropdownvalue);
//                           print(confirm_password.text);
//                           bool isUserNameUpdated= NAME.toString()!=name_control.text;
//                           bool isGenderUpdated=GENDER.toString()!=dropdownvalue;
//                           bool isUserIdUpdated=ID.toString()!=id_control.text;
//                           bool isPasswordUpdated= confirm_password.text=='' || confirm_password.text==null ? false: true;
//                           bool isCompanyNameUpdated=false;
//                           if(COMNAME==null)
//                           {
//                            bool isCompanyNameUpdated= companyName.text!='';
//                           }
//                           else{
//                             bool isCompanyNameUpdated= companyName.text!=COMNAME.toString();
//                           }
                          
//                           // companyName.text==''?false:() ;
//                           print(isUserNameUpdated);
//                           print( isGenderUpdated);
//                           print( isUserIdUpdated);
//                           print( isPasswordUpdated);
//                           print('-------------------');
//                           final response = await createAlbum_update_info(isUserNameUpdated, isGenderUpdated, isUserIdUpdated, isPasswordUpdated,
//                           isCompanyNameUpdated,
//                           MOB_not_EM!, 
//                           isUserNameUpdated?name_control.text:null, 
//                           isGenderUpdated ? dropdownvalue:null ,
//                            ID.toString(),
//                           isUserIdUpdated? id_control.text:null ,
//                            edit_password.text , 
//                            isPasswordUpdated? confirm_password.text:null,
//                            isCompanyNameUpdated? companyName.text:null,
//                            ); 
//                           if(response.statusCode==200 )
//                           {
                            
//                             SharedPreferences pref = await SharedPreferences.getInstance();
//                               pref.setString('name', name_control.text);
//                               pref.setString('id', id_control.text);
//                               pref.setString('gender',dropdownvalue);
//                               pref.setString('companyName',companyName.text);
//                               setState(() {
//                               NAME=name_control.text;
//                               GENDER=dropdownvalue;
//                               ID=id_control.text;
//                               COMNAME=companyName.text;
//                               });
//                               password.text ='';
//                               confirm_password.text='';
//                                 setState(()
//                                 {
//                                   edit=true;
//                                   loading_update=false;
//                                 });
//                                 edit_password.text='';
                        
//                           showOverlay(context,"successful");
//                           } 
  
//                         else if(response.statusCode==400)
//                         {
//                         name_control.text=NAME.toString();
//                         id_control.text=ID.toString();
//                         dropdownvalue=GENDER.toString();
//                         companyName.text= COMNAME==null ?'': COMNAME.toString();
//                         edit_password.text='';
//                         password.text ='';
//                         confirm_password.text='';
//                         setState(() {
//                                       edit=true;
//                                       loading_update=false;
//                                     });
//                       showOverlay(context,'please provide the details');


//                       }
//                           else if(response.statusCode==401)
//                         {
//                           name_control.text=NAME.toString();
//                           id_control.text=ID.toString();
//                           dropdownvalue=GENDER.toString();
//                           companyName.text= COMNAME==null ?'': COMNAME.toString();
//                           edit_password.text='';
//                           password.text ='';
//                           confirm_password.text='';
//                           setState(() {
//                                       edit=true;
//                                       loading_update=false;
//                                     });
//                       showOverlay(context,"password doesn't match");

        
//                         }
//                           else if(response.statusCode==500)
//                           {
//                             name_control.text=NAME.toString();
//                           id_control.text=ID.toString();
//                           dropdownvalue=GENDER.toString();
//                           companyName.text= COMNAME==null ?'': COMNAME.toString();
//                             edit_password.text='';
//                             password.text ='';
//                             confirm_password.text='';
//                             setState(() {
//                                         edit=true;
//                                         loading_update=false;
//                                       });
//                           showOverlay(context,"internal error");
                        
                  
//                           }
//                         }
//             Navigator.pop(context);
//           },
//           child: Text('ok',
//           style: TextStyle(
//           fontSize: 20),
//           ),
//         ),
//       ],
//     );
//           },
//                                         ); 
//   }
// }
