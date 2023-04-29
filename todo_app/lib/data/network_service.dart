import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  Future<List<dynamic>?> fetchTodos() async {
    try {
      final response =
          await get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      print(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      return [];
    }
  }
}
