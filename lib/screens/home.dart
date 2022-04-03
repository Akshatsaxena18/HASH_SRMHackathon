import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hash_srm/model/capturePics.dart';
import 'package:hash_srm/model/getDatabase.dart';
import 'package:hash_srm/screens/reviewPage.dart';
import 'package:hash_srm/screens/temp.dart';
import 'package:hash_srm/services/Predic.dart';
import 'package:hash_srm/widgets/weatherInfoView.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDeleted = false;
  int numImages = 0;
  bool isLoading = false;

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff587308),
        centerTitle: true,
        leading: Icon(Icons.arrow_right_sharp,size: 1,),
        title: TextButton(
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (ctx)=>TempPage()));
          },
            child:Text("Kisan Seva",style: TextStyle(fontSize: 24),),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Image.network(
              "https://farmer.gov.in/imagedefault/containerbg.jpg",
              width: double.infinity,
              height: double.infinity,
              repeat: ImageRepeat.repeat,
            ),
            Container(
              child: !isLoading?Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top Notifications
                  Container(
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // TODO: Weather info Page
                            WeatherInfoView(),
                            !isDeleted?DatabaseData.notif(context):Container(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom buttons
                  Container(
                    height: MediaQuery.of(context).size.height*0.12,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                        width: MediaQuery.of(context).size.width,
                        child: (numImages==0)?Container(
                        // height: MediaQuery.of(context).size.height*0.85,
                          alignment: Alignment.bottomCenter,
                          child: FloatingActionButton.extended(
                            backgroundColor: Color(0xff587308),
                          onPressed: () async {
                            print("Button Pressesd");
                            setState(() {
                              isLoading = true;
                            });
                            var img=await CapturePicture.getImages();
                            setState(() {
                              isLoading = false;
                              numImages = CapturePicture.images.length;
                            });
                          },
                            label: const Text(
                              "CAPTURE"
                            ),
                          icon: const Icon(
                            Icons.camera_alt_outlined
                          ),
                          // backgroundColor: Colors.green,
                        ),
                      ):Container(
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: FloatingActionButton.extended(
                                backgroundColor: Color(0xff587308),
                                  onPressed: () async {
                                    print("Add Button Pressed");
                                    setState(() {
                                      isLoading = true;
                                    });
                                    var img=await CapturePicture.getGallery();
                                    setState(() {
                                      isLoading = false;
                                      numImages = CapturePicture.images.length;
                                    });
                                  },
                                  label: Text(
                                    "Add ("+numImages.toString()+")"
                                  ),
                                icon: Icon(Icons.add),
                              ),
                            ),
                            Container(
                              child: FloatingActionButton.extended(
                                backgroundColor: Color(0xff587308),
                                  onPressed: () async {
                                    
                                    setState(() {
                                      isLoading = true;
                                      numImages = 0;
                                    });
                                    var s = await Prediction.getPredictions();
                                    if(s==false){
                                      print('error in main pred');
                                    }
                                    isDeleted = false;
                                    isLoading=false;
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewPage()));
                                    
                                  },
                                  label: const Text(
                                    "Done"
                                  ),
                                icon: Icon(Icons.done),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):Container(child: Center(child: CircularProgressIndicator()))),
          ],
        ),
      ));
  }
}
