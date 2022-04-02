import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'getCity.dart';
class APIDATA{
 static Future<dynamic> getSoildata()async{
   try {
     String state = await getState();
     var soil;
     var recommendations;
     String response = await rootBundle.loadString('assets/api/soil-crop.json');
     var json_datas = await json.decode(response);
     var json_data = List<dynamic>.from(json_datas);
    //  for(int i=0;i<json_data.length;i++){
    //    for(int j=0;j<json_data[i].state;j++){
    //      if(state.toString().split('').join('').toLowerCase()==json_data[i].States[j].toString().split('').join('').toLowerCase())
    //      {
    //        soil = json_data[i].name.toString();
    //        recommendations = json_data[i].Suitablecrop.join(' ').toString();
    //      }
    //    }
    //  }
    for(var i in json_data)
      {for(var j in i['States']){
        if (j.toString().toLowerCase()==state.toString().toLowerCase()){
          print(j.toString()+'\n'+i.toString());
          var sf = Map<String,dynamic>.from({'soil':i['name'],'recommendations':i['Suitablecrop'],'lack':i['Lack-in']});
          print("from sf"+sf['soil']);
          return Map<String,dynamic>.from({'soil':i['name'],'recommendations':i['Suitablecrop'],'lack':i['Lack-in']});
        }
      }}
    }catch(e){
      print(e.toString());
    }
    // print(json_data[0]['States'])
}
}