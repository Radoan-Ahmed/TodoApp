part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}

class TodosLoaded extends TodosState {
  TodosLoaded({required this.todos});
  final List<Todo>? todos;
}
