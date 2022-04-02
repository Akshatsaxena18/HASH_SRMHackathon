import 'dart:convert';
import 'package:http/http.dart' as http;
//https://github.com/nandakishormpai/Plant_Disease_Detector
//thanks vroooos
Future<dynamic> getSuggestions(imgdata)async {
  try{
    print("in");
    print(imgdata.runtimeType);
    print(imgdata);
    final response = await http.post(
      Uri.parse("https://plant-disease-detector-pytorch.herokuapp.com/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'image': base64Encode(imgdata),
      }),
    );
    if (response.statusCode != 201) {
      print('in if');
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // print(jsonDecode(response.body).toString());
      var a = json.decode(response.body);
      var as = Map<String,dynamic>.from(a);
      Map r={};
      for (var i in as.entries){
        r[i.key]=i.value.toString();
      }
      print(r);
      return r;
      //respons type:
      //disease,plant,remedy

    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print('in else');
      return {'plant':'tomato','disease':'late','remedy':'remdiy is'};
    }}
  catch(e){
    print('in error'+e.toString());
    return {'plant':'tomato','disease':'late','remedy':'remdiy is'};
  }

}


//in pubspec add http
//https://soilgrids.org/