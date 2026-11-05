import 'package:flutter/material.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routine = [
      ['Sunday', 'Mathematics', '9:00 AM'],
      ['Monday', 'English', '10:00 AM'],
      ['Tuesday', 'Physics', '11:00 AM'],
      ['Wednesday', 'Chemistry', '9:30 AM'],
      ['Thursday', 'Biology', '10:30 AM'],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Class Routine')),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: routine.length,
        itemBuilder: (context, index) {
          final item = routine[index];

          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.calendar_today)),
              title: Text(item[0]),
              subtitle: Text(item[1]),
              trailing: Text(
                item[2],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
