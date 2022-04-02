import 'dart:async';

import 'package:hash_srm/model/User.dart';
import 'package:hash_srm/model/capturePics.dart';
import 'package:hash_srm/model/create_pdf.dart';
import 'package:hash_srm/model/databaseStorage.dart';
import 'package:hash_srm/model/getSoilData.dart';
import 'package:hash_srm/model/pdf_format.dart';
import 'package:hash_srm/model/storageModels.dart';
import 'package:hash_srm/model/weather_data.dart';

class Prediction {
  static var preds;
  static Future<bool> getPredictions() async {
    try{    //get predictions and pass "pred" to next page
    var UID = MyUser.UID;
    var RID = DateTime.now().millisecondsSinceEpoch.toString();
    print("RId"+RID);
    var filepaths = CapturePicture.getFilePaths();
    print(filepaths);
    var predictions =await CapturePicture.getData();
    print((predictions).toString());
    var soildata = await APIDATA.getSoildata();
    print(soildata.toString());
    Predictions pred = Predictions(
        disease: predictions['disease'].toString(),
        plantName: predictions['plant'].toString(),
        remedy: predictions['remedy'].toString(),
        recommendations:soildata['recommendations'].toString());
    preds=pred;
    // //Details
    Details details = Details(soil: soildata['soil'].toString(), humidity: WeatherData.weather.humidity.toString(), crop: predictions['plant'].toString(), no_of_cases: 1, location: WeatherData.weather.city.toString(), no_of_images: CapturePicture.images.length,lackIn:soildata['lack'].toString());
    // //store images to database
    var EID = await Database.getExpert(predictions['plant'].toString());
    // print(EID);
    String no_of_cases = '0';//TODO
    ReportFormat report = ReportFormat(UID: UID, EID: EID, crop: details.crop, humidity: details.humidity, location: details.location, lock: '0', no_of_cases: no_of_cases, no_of_images: details.no_of_images.toString(), soil: details.soil,remedy:pred.remedy.toString(),disease:predictions['disease']);
    var urls = await Database.pushImages(RID);
    Database.pushdata(RID, report, urls);
    //generate pdf
    generatePDF(PDFTitle(title: 'Request'),Id(id:RID,time:DateTime.now().toString()) , details, CapturePicture.images, pred);
    //clear images
    CapturePicture.images.clear();
    CapturePicture.filepaths.clear();
    print('pred'+pred.toString());
    print("report"+report.toString());
    return true;
    }catch(e){
      print("\n\n\nMAIN ERROR::::::::::::"+e.toString()+'\n\n\n\n');
      return false;
    }
  }
}