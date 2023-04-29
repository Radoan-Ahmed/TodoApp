import 'package:flutter/material.dart';
import 'package:todo_app/core/navigation/route_config.dart';
import 'package:todo_app/presentation/screens/todos_screen.dart';

void main() {
  runApp(TodoApp(router: ApppRouteConfig()));
}

class TodoApp extends StatelessWidget {
  final ApppRouteConfig router;

  const TodoApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.routes,
    );
  }
}
