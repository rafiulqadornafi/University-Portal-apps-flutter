import 'package:flutter/material.dart';

import '../../data/demo_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Results')),
      body: ValueListenableBuilder(
        valueListenable: DemoData.results,
        builder: (context, results, _) {
          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.emoji_events, color: Colors.orange),
                  title: Text(results[index]),
                  trailing: const Icon(Icons.check_circle, color: Colors.green),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
