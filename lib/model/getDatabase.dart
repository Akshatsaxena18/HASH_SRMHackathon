
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'User.dart';

class DatabaseData{
  static Future<List<dynamic>> getNotifications()async{
    List json=[];
    var UID = MyUser.UID.toString();
    print(UID);
    await FirebaseFirestore.instance.collection('reports').where('UID',isEqualTo: UID).get().then((snap){
      for(var i in snap.docs){
        json.add(i.data());
      }
    });
    print("json:"+json.toString());
    return json;
  }
  static Widget notif(BuildContext ctx){
    try {
      var UID = MyUser.UID.toString();
      return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(ctx).size.height,
          child: StreamBuilder<QuerySnapshot>(stream:FirebaseFirestore.instance.collection('reports').where('UID',isEqualTo: UID).snapshots(),builder: (ctx,snap){
            if(snap.hasData){
              final List<dynamic> documents = snap.data!.docs;
              return Container(
                child: Center(
                      child: ListView(
                        children:documents.map((doc){
                          return Column(children: <Widget>[
                          ListTile(
                            leading: doc['lock']=='2'?Icon(Icons.thumb_up,color: Colors.green):Icon(Icons.pending_actions,color: Colors.red,),
                            title: doc['lock']=='2'?Text(doc['crop']+" \nDisease: "+doc['disease'].toString(),):Text(doc['crop']),
                            subtitle:Text(
                              "Report :"+doc['RID'],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: Text('Check Details'),
                                onPressed: () {
                                  // print(doc['remedy'].toString());
                                  // Navigator.push(ctx, MaterialPageRoute(builder: (context)=>ReviewPage2(doc)));
                                },
                              ),
                              const SizedBox(width: 6),
                              TextButton(
                                child: Text('Download Report'),
                                onPressed: () {
                                  // setState(() {
                                  //   // isDeleted = true;
                                  // });
                                },
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      );}).toList()
                      ),
                  ),
              );
            }
            else{
              print("no data");
              return Text('No Notifications');
            }
          }),
        ),
      );
    } on Exception catch (e) {
      // TODO
      return Text("ERROR");
    }
  }
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