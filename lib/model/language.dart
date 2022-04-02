import 'package:learning_translate/learning_translate.dart';
import 'package:text_to_speech/text_to_speech.dart';
class LanguageML{
  static TextToSpeech ttp = TextToSpeech();
  static var languagesMappings = {
    'hindi':'hi',
    'telugu':'te',
    'tamil':'ta',
    'kannada':'kn',
    };
  //returns future string of converted text .. if error returns null string
  static Future<String> convertLanguage(String to_lang,String text)async{
    try {
      var ans;
      if(languagesMappings[to_lang]==null){
        ans = 'hi';
      }
      else{
        ans = languagesMappings[to_lang];
      }
      bool isDownloaded = await TranslationModelManager.check(ans);
      bool engdownload =  await TranslationModelManager.check('en'); 
      if(!isDownloaded){
        print("downloading lang"+ans.toString());
        await TranslationModelManager.download(ans);
        print("done "+ans.toString());
      }
      else{
        print(ans.toString()+"downloaded already");
      }
      if(!engdownload){
        print("downloading eng lang");
        await TranslationModelManager.download('en');
        print("done eng download");
      }
      else{
        print(ans.toString()+"downloaded already");
      }
      Translator translator = Translator(from: "en", to: ans);
      String translatedText = await translator.translate(text);
      translator.dispose();
      print(translatedText);
      return translatedText.toString();
    } on Exception catch (e) {
      // print("error"+e.toString());
      return "";
    }
  }
  static void speechPause(){
    try{
    LanguageML.ttp.pause();
    }catch(e){print(e.toString());}
  }
  static void speechResume(){
    try{
    LanguageML.ttp.resume();
    }catch(e){print(e.toString());}
  }
  static void speechOutput(String data,String to_lang){
    try {
      LanguageML.ttp.setRate(0.8);
      LanguageML.ttp.setPitch(0.8);
    } on Exception catch (e) {
      // TODO
      print(e);
    }
    // ttp.setVolume(1);
    var ans;
    if(languagesMappings[to_lang]==null){
        ans = 'hi';
      }
      else{
        ans = languagesMappings[to_lang];
      }
      print("in sppec");
    LanguageML.ttp.setLanguage(ans);
    print('set lan');
    LanguageML.ttp.speak(data);
    
    print('done');
  }
}