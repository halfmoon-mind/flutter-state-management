import 'package:bloc_todo/bloc.dart';
import 'package:bloc_todo/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              var todo = state.todos[index];
              return ListTile(
                title: Text(todo.title),
                trailing: Checkbox(
                  value: todo.isDone,
                  onChanged: (_) {
                    context.read<TodoBloc>().add(ToggleTodo(index));
                  },
                ),
                onLongPress: () {
                  context.read<TodoBloc>().add(RemoveTodo(index));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _showDialog(BuildContext context) {
    var title = '';
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add TODO'),
          content: TextField(
            onChanged: (value) {
              title = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<TodoBloc>().add(AddTodo(title));
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
