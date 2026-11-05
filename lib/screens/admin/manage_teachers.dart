import 'package:flutter/material.dart';

import '../../data/demo_data.dart';

class ManageTeachers extends StatelessWidget {
  const ManageTeachers({super.key});

  void addTeacher(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Teacher'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Teacher Name and Subject',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                DemoData.addTeacher(controller.text.trim());
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Teachers')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTeacher(context),
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: DemoData.teachers,
        builder: (context, teachers, _) {
          return ListView.builder(
            itemCount: teachers.length,
            itemBuilder: (context, index) {
              final teacher = teachers[index];

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.school, color: Colors.purple),
                  title: Text(teacher),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      DemoData.deleteTeacher(teacher);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
