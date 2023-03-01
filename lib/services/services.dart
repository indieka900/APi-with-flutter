import 'package:http/http.dart' as http;
import 'dart:convert';

var url = Uri.http('web-production-9444.up.railway.app', '/advocates/');

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

void delete(String username) async {
  var url =
      Uri.http('web-production-9444.up.railway.app', '/advocates/$username');
  try {
    final response = await http.delete(url);

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to delete $username, ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}
