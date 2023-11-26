// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_api/todo.dart';

class UpdateTaskModal extends StatefulWidget {
  const UpdateTaskModal({
    super.key,
    required this.todo,
    required this.onTodoUpdate,
  });

  final Todo todo;
  final Function(String) onTodoUpdate;
  @override
  State<UpdateTaskModal> createState() => _UpdateTaskModalState();
}

class _UpdateTaskModalState extends State<UpdateTaskModal> {
  late final TextEditingController todoTEController;
  @override
  void initState() {
    super.initState();
    todoTEController = TextEditingController(text: widget.todo.details);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Update task modal',
                  style: Theme.of(context).textTheme.titleLarge),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            maxLines: 4,
            controller: todoTEController,
            decoration: const InputDecoration(
              hintText: "Enter your update todo here",
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onTodoUpdate(todoTEController.text.trim());
                Navigator.pop(context);
              },
              child: const Text("update"),
            ),
          )
        ],
      ),
    );
  }
}
