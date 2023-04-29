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

  Future<bool> patchTodo(Map<String, String> patchObj, int id) async {
    try {
      await patch(Uri.parse('https://jsonplaceholder.typicode.com/todos/${id}'),
          body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }
}
