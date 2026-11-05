import 'package:flutter/material.dart';

import '../../data/demo_data.dart';
import '../../models/student_model.dart';

class ManageStudents extends StatelessWidget {
  const ManageStudents({super.key});

  void addStudent(BuildContext context) {
    final name = TextEditingController();
    final id = TextEditingController();
    final studentClass = TextEditingController();
    final section = TextEditingController();
    final email = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Student'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Student Name'),
              ),
              TextField(
                controller: id,
                decoration: const InputDecoration(labelText: 'Student ID'),
              ),
              TextField(
                controller: studentClass,
                decoration: const InputDecoration(labelText: 'Class'),
              ),
              TextField(
                controller: section,
                decoration: const InputDecoration(labelText: 'Section'),
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (name.text.trim().isEmpty || id.text.trim().isEmpty) {
                return;
              }

              if (DemoData.students.value.any(
                (student) => student.id == id.text.trim(),
              )) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Student ID already exists')),
                );
                return;
              }

              DemoData.addStudent(
                StudentModel(
                  id: id.text.trim(),
                  name: name.text.trim(),
                  studentClass: studentClass.text.trim(),
                  section: section.text.trim(),
                  email: email.text.trim(),
                ),
              );

              Navigator.pop(dialogContext);
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
      appBar: AppBar(title: const Text('Manage Students')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addStudent(context),
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: DemoData.students,
        builder: (context, students, _) {
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];

              return Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(student.name),
                  subtitle: Text(
                    'ID: ${student.id}\n'
                    'Class: ${student.studentClass} - '
                    '${student.section}',
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      DemoData.deleteStudent(student.id);
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
