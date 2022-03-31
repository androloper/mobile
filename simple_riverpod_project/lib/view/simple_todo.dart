import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_riverpod_project/models/todo.dart';
import '../provider/todo_providers.dart';

class TodoTile extends HookConsumerWidget {
  final Todo todo;
  TodoTile({required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.indigoAccent,
      child: ListTile(
        title: Text(todo.content, style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: todo.done
              ? const Icon(Icons.check_box, color: Colors.greenAccent)
              : const Icon(Icons.check_box_outline_blank, color: Colors.white,),
          onPressed: () {
            ref.read(todoViewController).toggleDoneStatus(todo);
          },
        ),
        trailing: Text(todo.timestamp.toIso8601String(), style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class SimpleTodo extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(todoViewController).initState();
      return ref.read(todoViewController).dispose;
    }, []);
    final textController = useTextEditingController();
    final List<Todo>? todoList = ref.watch(sortedTodoListState);
    if (todoList == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('IG @FrontendsUnion',
            style: TextStyle(color: Colors.amberAccent),),
          actions: [
            IconButton(
              icon: const Icon(Icons.sort, color: Colors.amberAccent,),
              onPressed: () {
                ref.read(todoViewController).toggleSortOrder();
              },
            )
          ],
      ),
      body: Column(
        children: [
          TextField(controller: textController,
        decoration: const InputDecoration(
              labelText: 'What To Do')),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, int index) =>
                  TodoTile(todo: todoList[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.amberAccent,),
        onPressed: () {
          ref.read(todoViewController).addTodo(textController);
        },
      ),
    );
  }
}