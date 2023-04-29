import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/data/network_service.dart';

class Repository {
  Repository({required this.networkService});
  NetworkService networkService;
  Future<List<Todo>?> fetchTodos() async {
    final todosRaw = await networkService.fetchTodos();
    return todosRaw?.map((e) => Todo.fromJson(e)).toList();
  }
}
