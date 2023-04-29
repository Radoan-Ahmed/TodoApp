import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/navigation/route_name.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/data/network_service.dart';
import 'package:todo_app/data/repository.dart';
import 'package:todo_app/presentation/screens/add_todo_screen.dart';
import 'package:todo_app/presentation/screens/edit_todo_screen.dart';
import 'package:todo_app/presentation/screens/todos_screen.dart';

class ApppRouteConfig {
  Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.initialRoute:
        return _getInitialRoute();
      case RouteName.editTodoRoute:
        return _getEditTodoRoute();
      case RouteName.addTodoRoute:
        return _getAddTodoRoute();
    }
    return _defaultRoute();
  }

  static MaterialPageRoute _routeBuilder(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }

  static MaterialPageRoute _defaultRoute() {
    return _routeBuilder(const Scaffold(
      body: Center(
        child: Text('Unknown route'),
      ),
    ));
  }

  static MaterialPageRoute _getInitialRoute() {
    return _routeBuilder(BlocProvider(
      create: (context) =>
          TodosCubit(repository: Repository(networkService: NetworkService())),
      child: TodosScreen(),
    ));
  }

  static MaterialPageRoute _getEditTodoRoute() {
    return _routeBuilder(EditTodoScreen());
  }

  static MaterialPageRoute _getAddTodoRoute() {
    return _routeBuilder(AddTodoScreen());
  }
}
