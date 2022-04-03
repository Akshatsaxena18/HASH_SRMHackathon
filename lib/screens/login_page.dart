import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hash_srm/model/User.dart';
import 'package:hash_srm/model/databaseStorage.dart';
import 'package:hash_srm/model/storageModels.dart';
import 'package:hash_srm/screens/home.dart';
import 'package:hash_srm/widgets/common_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool otpSent = false;

  static TextEditingController nameTextController = new TextEditingController();
  static TextEditingController aadhaarNumberController = new TextEditingController();
  static TextEditingController phoneNumberController = new TextEditingController();
  static TextEditingController otpController = new TextEditingController();
  void createUser() async {
    final prefs = await SharedPreferences.getInstance();
    if(_formKey.currentState!.validate()) {
      print("Pushing Data");
      MyUser.UID = DateTime
          .now()
          .microsecondsSinceEpoch
          .toString();
      
      User user = new User(
          UID: MyUser.UID,
          aadhar: aadhaarNumberController.text,
          name: nameTextController.text,
          phone: phoneNumberController.text);
      await Database.createUser(user);
      await prefs.setBool('uidset',true);
      await prefs.setString('UID', MyUser.UID);
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    } else {
      setState(() {
        isLoading = false;
      });
      CommonStyles.snackBar(context, "User Creation Problem");
      print('User Creation Problem');
    }
  }

  @override
  Widget build(BuildContext context) {
    String language ='hindi';
    bool alert = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff587308),
        title: Center(child: Text("HASH")),
        leading: GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>TempPage()));
          },
          child: Container(
            child: Image.asset(
                "assets/images/logo.png",
              width: 100,
              height: 100,
            )
          ),
        ),
      ),
      body:alert?AlertDialog(actions: [
      Row(children: [ Icon(Icons.language),Text("  Select Language"),]),
      RadioListTile(
        title: Text('ENGLISH'),
        value: 'english', groupValue: language, onChanged: (val){
        setState(() {
          language = val.toString();
        });
      }),
      RadioListTile(
        title:Text("HINDI"),
        value: 'hindi', groupValue: language, onChanged: (val){
        setState(() {
          language = val.toString();
        });
      }),
      Row(
        children: [
          Radio(value: 'kannada', groupValue: language, onChanged: (val){
            setState(() {
              language = val.toString();
            });
          }),
          Text("KANNADA"),
        ],
      ),
      TextButton(onPressed: (){
        setState(() {
          alert = false;
        });
      }, child: Text('USE'))
    ],): SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/home_page_bg.jpg",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2,
                      sigmaY :2
                  ),
                  child: !isLoading?Container(
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Text(
                              //   "HASH",
                              //   style: TextStyle(
                              //     color: Colors.white
                              //   ),
                              // ),
                              // SizedBox(height: 35,),
                              TextFormField(
                                validator: (value) {
                                  if(value==null || value.isEmpty) {
                                    return 'It Cannot be Empty!';
                                  }
                                },
                                controller: nameTextController,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                keyboardType: TextInputType.text,
                                decoration: CommonStyles.textFieldStyle("Enter Name"),
                              ),
                              SizedBox(height: 15,),
                              TextFormField(
                                validator: (value) {
                                  if(value==null || value.isEmpty) {
                                    return 'Aadhaar Number cannot be empty';
                                  } else if(value.length<12) {
                                    return 'Enter 12-digit';
                                  }
                                },
                                controller: aadhaarNumberController,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                maxLength: 12,
                                keyboardType: TextInputType.number,
                                decoration: CommonStyles.textFieldStyle("Enter Aadhaar Number"),
                              ),
                              SizedBox(height: 5,),
                              TextFormField(
                                validator: (value){
                                  if(value==null) {
                                    return 'It cannot be empty';
                                  } else if(value.length<10) {
                                    return 'Enter 10 digit phone number';
                                  }
                                },
                                controller: phoneNumberController,
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: CommonStyles.textFieldStyle("Enter Phone Number"),
                              ),
                              SizedBox(height: 5,),
                              otpSent?TextFormField(
                                validator: (value) {
                                  if(value==null) {
                                    return 'Enter Otp';
                                  }
                                  return null;
                                },
                                controller: otpController,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                                // autofocus: true,
                                enabled: true,
                                decoration: CommonStyles.textFieldStyle("Enter OTP"),
                              ):
                              GestureDetector(
                                onTap: () async {
                                  // SMS.sendMessage();
                                  if(_formKey.currentState!.validate()) {
                                    print('OTP Sending');
                                    setState(() {
                                      otpSent = true;
                                    });
                                  } else {

                                  }
                                },
                                child: Container(
                                  child: CommonStyles.roundButton(context, "Send OTP"),
                                ),
                              ),
                              SizedBox(height: 20,),
                              otpSent?GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  //TODO : Change push to PushReplacement
                                  otpSent=false;
                                  createUser();
                                },
                                child: Container(
                                  child: CommonStyles.roundButton(context, "Submit"),
                                ),
                              ):Container()
                            ],
                          ),
                        )
                      ],
                    ),
                  ):
                  Container(child: Center(child: CircularProgressIndicator())),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
