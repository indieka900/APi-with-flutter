import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var url = Uri.http('127.0.0.1:8000', '/advocates/');
var url2 = Uri.http('127.0.0.1:8000', '/companies/');

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

  static Future<List<dynamic>> fetchCompanies() async {
    final response = await http.get(url2);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body).reversed.toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

void delete(String username) async {
  var url = Uri.http('127.0.0.1:8000', '/advocates/$username');
  try {
    final response = await http.delete(url);

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to delete $username, ${response.statusCode}');
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
