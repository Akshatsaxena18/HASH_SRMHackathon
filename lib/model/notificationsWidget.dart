
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Widget notificationWidget(){
  return StreamBuilder(stream: FirebaseFirestore.instance.snapshotsInSync(),
  builder: (ctx,snapshot){
    final data = snapshot.requireData;
    return Container(
      child: Column(
        children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.notifications),
                                      title: Text(
                                        data.toString()
                                      ),
                                      subtitle: Text("Description"),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          child: Text('Check Details'),
                                          onPressed: () {
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewPage()));
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        TextButton(
                                          child: Text('Delete'),
                                          onPressed: () {
                                            
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  ],
                                
      )
    );
  },);
}
/*
<Widget>[
                                    ListTile(
                                      leading: Icon(Icons.notifications),
                                      title: Text(
                                        "Notification 1",
                                      ),
                                      subtitle: Text("Description"),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          child: Text('Check Details'),
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewPage()));
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        TextButton(
                                          child: Text('Delete'),
                                          onPressed: () {
                                            setState(() {
                                              isDeleted = true;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  ],
                                
*/