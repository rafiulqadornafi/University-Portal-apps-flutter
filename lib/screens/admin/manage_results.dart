import 'package:flutter/material.dart';

import '../../data/demo_data.dart';

class ManageResults extends StatelessWidget {
  const ManageResults({super.key});

  void addResult(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Result'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Example: Biology - A+'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                DemoData.addResult(controller.text.trim());
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
      appBar: AppBar(title: const Text('Manage Results')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addResult(context),
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: DemoData.results,
        builder: (context, results, _) {
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.grade, color: Colors.green),
                  title: Text(results[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
