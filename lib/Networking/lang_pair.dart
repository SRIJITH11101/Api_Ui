import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_03/Models/language_model.dart';

class LangPair {
  List<LanguageModel> languagePair = [];
  String langOne = '';
  String langTwo = '';
  String langPairName = '';
  Future<void> getLangPair() async {
    var uri =
        'https://api.babelonia.nl/site/category/getmaincatlist?type=tasker';
    var url = Uri.parse(uri);
    try {
      http.Response response =
          await http.get(url, headers: {"Accept-Language": "en"});
      if (response.statusCode == 200) {
        var langData = jsonDecode(response.body);
        List<dynamic> langDetails = langData['data'];
        for (var detail in langDetails) {
          languagePair.add(LanguageModel(detail['name']));
        }
        print(languagePair);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getLangCodeWithName(String langPairName) async {
    this.langPairName = langPairName;
    var uri =
        'https://api.babelonia.nl/site/category/getmaincatlist?type=tasker';
    var url = Uri.parse(uri);
    try {
      http.Response response =
          await http.get(url, headers: {"Accept-Language": "en"});
      if (response.statusCode == 200) {
        var langData = jsonDecode(response.body);
        List<dynamic> langDetails = langData['data'];
        int count = langDetails.length;
        for (var detail in langDetails) {
          if (detail['name'] == langPairName) {
            langOne = detail['catlangone'];
            langTwo = detail['catlangtwo'];
          }
        }
        // for (var i = 0; i < count; i++) {
        //   if (langPairName == langData['data'][i]['names']) {
        //     langOne = langData['data'][i]['catlangone'];
        //     langTwo = langData['data'][i]['catlangtwo'];
        //   }
        // }
        //print('$langOne and $langTwo');
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
