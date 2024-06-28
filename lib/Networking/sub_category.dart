import 'dart:convert';

import 'package:http/http.dart' as http;

class SubCategory {
  Future<void> getSubCategoryDetails(String langOne, String langTwo) async {
    var uri =
        'https://api.babelonia.nl/site/home/sub-category-list?langone=$langOne&langtwo=$langTwo&tasker=true';
    var url = Uri.parse(uri);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var subCatData = jsonDecode(response.body);
        List<dynamic> subCatDetails = subCatData['response'];
        print(subCatDetails);
        // for (var detail in subCatDetails) {
        //   languagePair.add(LanguageModel(detail['name']));
        // }
        // print(languagePair);
      } else {
        print(response.statusCode);
        print(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}