import 'package:hash_srm/model/getCity.dart';
import 'package:url_launcher/url_launcher.dart';
class WebView{
  static void openMap(String query)async{
    try {
      var coordinates = await getCoordinates();
      String url = 'https://www.google.com/maps/search/$query/&query=${coordinates[0]},${coordinates[1]}';
      await launch(url);
    } on Exception catch (e) {
      print("cannot open maps");
    }
  }
  static void openLink(String link)async{
    try{
      await launch(link);
    }catch(e){
      print("unable to open link :"+e.toString());
    }
  }
}