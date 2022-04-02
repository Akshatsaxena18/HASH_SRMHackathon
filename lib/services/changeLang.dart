import 'package:hash_srm/model/language.dart';

class changeLang{
  static var vals = ['enter name','enter aadhar number','enter phone number'];
  static Future<List<String>> lang(String lan)async{
    List<String> ans = [];
    for(var val in changeLang.vals){
      ans.add(await LanguageML.convertLanguage(val,lan));
    }return ans;
  }

}