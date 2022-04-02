// import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:image_picker/image_picker.dart';

class PDFTitle{
  final String title;
  const PDFTitle({
    required this.title,
  });
}

class Predictions{
  final String plantName;
  final String disease;
  final String remedy;
  final String recommendations;
  const Predictions({
    required this.disease,
    required this.plantName,
    required this.remedy,
    required this.recommendations
  });
}
class Details{
  final String soil;
  final String humidity;
  final String lackIn;
  final String crop;
  final int no_of_cases;
  final String location;
  final int no_of_images;
  const Details({
    required this.soil,
    required this.humidity,
    required this.crop,
    required this.no_of_cases,
    required this.location,
    required this.no_of_images,
    required this.lackIn,
  });
}
class Id{
  final String id;
  final String time;
  const Id({
    required this.id,
    required this.time
  });
}
// class Images_upload{
// //   meth()async{
// // var img = await ImagePicker().pickImage(source: ImageSource.camera);
// // var bytes = img?.readAsBytes();
// //   }
//   final List<dynamic> images;
//   const Images_upload({
//     required this.images,
//   });
// }
class Report{
  static Widget buildTitle(PDFTitle title){
    return Container(
      alignment:Alignment.center,
      child: Text(title.title.toString()+" REPORT",style: TextStyle(fontBold: Font.timesBold())),
    );
  }
  static Widget buildID(PDFTitle title,Id id){
    return Container(
      child: Column(children: [
        Text(title.title.toString()+" ID"+id.id.toString()),
        Text("Date: "+id.time.toString())
      ])
    );
  }
  static Widget buildDetails(Details details){
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(children: [
        Text("CROP : "+details.crop),
        Text("SOIL : "+details.soil),
        Text("HUMIDITY : "+details.humidity),
        Text("LOCATION : "+details.location),
        Text("NUMBER OF CASES REPORTED IN THAT LOCATION : "+details.no_of_cases.toString()),
        Text("NUMBER OF IMAGES ATTACHED : "+details.no_of_images.toString()),
        Text('SOIL LACKS :'+details.lackIn),
      ]),
    );
  }
  static Widget buildPredictions(Predictions pred){
    return Container(
      child: Column(children: [
        Text("Plant : "+pred.plantName),
        Text("Disease : "+pred.disease),
        Text("Remedy : "+pred.remedy),
      ])
    );
  } 
}
