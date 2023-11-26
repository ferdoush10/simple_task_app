import 'package:flutter/material.dart';
import 'package:todo_api/add_new_task_modal.dart';
import 'package:todo_api/todo.dart';
import 'package:todo_api/update_task_modal.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('todos'),
      ),
      body: ListView.separated(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          Todo todo = todoList[index];
          final String formatedDate =
              DateFormat('hh:mm a dd-MM-yyyy').format(todo.createdDateTime);
          return ListTile(
            tileColor: todo.status == 'done' ? Colors.grey : null,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Actions"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: const Text("Update"),
                            leading: const Icon(Icons.edit),
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return UpdateTaskModal(
                                      todo: todo,
                                      onTodoUpdate: (String updateDetailsText) {
                                        updateTodo(index, updateDetailsText);
                                      },
                                    );
                                  });
                            },
                          ),
                          const Divider(height: 0),
                          ListTile(
                            title: const Text("Delete"),
                            leading: const Icon(Icons.delete),
                            onTap: () {
                              //TODO - Delete the item from the list
                              deleteTodo(index);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
            onLongPress: () {
              String currentStatus =
                  todo.status == 'pending' ? 'done' : 'pending';
              updateTodoStatus(index, currentStatus);
            },
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(todo.details),
            subtitle: Text(formatedDate),
            trailing: Text(todo.status.toUpperCase()),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 4,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddNewTaskModal(
                  onAddTap: (Todo todo) {
                    addTodo(todo);
                  },
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

//add todo
  void addTodo(Todo todo) {
    todoList.add(todo);
    setState(() {});
  }

//delete todo
  void deleteTodo(int index) {
    todoList.removeAt(index);
    setState(() {});
  }

// update todo
  void updateTodo(int index, String todoDetails) {
    todoList[index].details = todoDetails;
    setState(() {});
  }
//todo status

  void updateTodoStatus(int index, String status) {
    todoList[index].status = status;
    setState(() {});
  }
}
