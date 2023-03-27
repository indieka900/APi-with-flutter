import 'package:http/http.dart' as http;
import 'dart:convert';

var url = Uri.http('127.0.0.1:8000', '/companies/');

class Services {
  static Future<List<dynamic>> fetchData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body).reversed.toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

void main() async {
  var data = await Services.fetchData();
  print(data);
}
