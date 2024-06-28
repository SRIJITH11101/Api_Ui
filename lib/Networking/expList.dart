import 'dart:convert';

import 'package:http/http.dart' as http;

class ExpList {
  List<String> expList = [];
  Future<List<String>> getExpList() async {
    var uri = 'https://api.babelonia.nl/site/category/getexperiencelist';
    var url = Uri.parse(uri);
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var expData = jsonDecode(response.body);
        List<dynamic> expDetails = expData['data'];
        for (var detail in expDetails) {
          expList.add(detail['name']);
        }
        print(expList);
      } else {
        print(response.statusCode);
      }
      return expList;
    } catch (e) {
      print('Error: $e');
    }
    return expList;
  }
}
