import 'package:bloc_todo/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todo {
  String title;
  bool isDone;

  Todo({required this.title, this.isDone = false});
}

class TodoState {
  final List<Todo> todos;

  TodoState({this.todos = const []});
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<AddTodo>(_onAddTodo);
    on<ToggleTodo>(_onToggleTodo);
    on<RemoveTodo>(_onRemoveTodo);
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    emit(TodoState(
        todos: List.from(state.todos)..add(Todo(title: event.title))));
  }

  void _onToggleTodo(ToggleTodo event, Emitter<TodoState> emit) {
    var updatedTodos = List<Todo>.from(state.todos);
    updatedTodos[event.index].isDone = !updatedTodos[event.index].isDone;
    emit(TodoState(todos: updatedTodos));
  }

  void _onRemoveTodo(RemoveTodo event, Emitter<TodoState> emit) {
    emit(TodoState(todos: List.from(state.todos)..removeAt(event.index)));
  }
}
