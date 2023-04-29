import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/navigation/route_name.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/data/models/todo.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos Screen"),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, RouteName.addTodoRoute),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          if (!(state is TodosLoaded)) {
            return Center(child: CircularProgressIndicator());
          }

          final todos = (state as TodosLoaded).todos;

          return SingleChildScrollView(
            child: Column(children: [
              if (todos != null) ...todos.map((e) => _todo(e, context)),
            ]),
          );
        },
      ),
    );
  }

  Widget _todo(Todo todo, context) {
    print(" The id is ${todo.id}");
    return _listTile(todo, context);
  }

  Widget _listTile(Todo todo, context) {
    return Dismissible(
        key: Key("${todo.id}"), child: _makeTodoList(todo, context));
  }

  Widget _makeTodoList(Todo todo, context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: [
                        Text(
                          todo.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  _complitionIndicator(todo, context),
                ],
              )
            ],
          ),
        ));
  }

  Widget _complitionIndicator(Todo todo, context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 4.0,
            color: todo.completed ? Colors.green : Colors.red,
          )),
    );
  }
}
