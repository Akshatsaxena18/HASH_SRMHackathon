import 'package:http/http.dart';

class User{
  final String name;
  final String aadhar;
  final String phone;
  final String UID;
  const User({
    required this.UID,
    required this.aadhar,
    required this.name,
    required this.phone
  });
}

class Expert{
  final String expertId;
  final String password;
  final String phone;
  final String EID;
  final String crop;
  const Expert({
    required this.EID,
    required this.expertId,
    required this.password,
    required this.phone,
    required this.crop
  });
}

class ReportFormat{
  final String remedy;
  final String disease;
  final String UID;
  final String EID;
  final String crop;
  final String soil;
  final String location;
  final String humidity;
  final String no_of_images;
  final String no_of_cases;
  final String lock;
  const ReportFormat({
    required this.disease,
    required this.remedy,
    required this.UID,
    required this.EID,
    required this.crop,
    required this.humidity,
    required this.location,
    required this.lock,
    required this.no_of_cases,
    required this.no_of_images,
    required this.soil
  });
}

class ResponseReport{
  final String UID;
  final String EID;
  final String crop;
  final String soil;
  final String location;
  final String humidity;
  final String no_of_images;
  final String no_of_cases;
  final String lock;
  final String links;
  final String message;
  final String disease;
  final String products;
  const ResponseReport({
    required this.UID,
    required this.EID,
    required this.crop,
    required this.humidity,
    required this.location,
    required this.lock,
    required this.no_of_cases,
    required this.no_of_images,
    required this.soil,
    required this.links,
    required this.message,
    required this.disease,
    required this.products
  });
}
