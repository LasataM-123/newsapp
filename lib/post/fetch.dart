import "dart:convert";

import "package:http/http.dart" as http;

import "package:dio/dio.dart";

class Fetch {
  final Dio _dio = Dio();
  Future<List<dynamic>> fetchPost() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {'Accept': 'application/json'},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Future<List<dynamic>> fetchMethod() async {
  //   try {
  //     final response = await _dio.get(
  //       'https://jsonplaceholder.typicode.com/posts',
  //     );
  //     return response.data;
  //   } catch (e) {
  //     throw Exception("Error fetching news: $e");
  //   }
  // }
}
