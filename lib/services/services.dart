import 'package:http/http.dart' as http;
import 'dart:convert';

var url = Uri.http('localhost:8000', '/advocates/');

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

  static Future<http.Response> createResource(Map<String, String> data) async {
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to create resource');
    }
  }
}

void delete(String username) async {
  var url = Uri.http('localhost:8000', '/advocates/$username/');
  try {
    final response = await http.delete(url);

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to delete $username');
    }
  } catch (e) {
    //Text(e.toString());
  }
}
