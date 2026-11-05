import 'package:flutter/material.dart';

import '../../data/demo_data.dart';
import '../../models/notice_model.dart';

class ManageNotices extends StatelessWidget {
  const ManageNotices({super.key});

  void addNotice(BuildContext context) {
    final title = TextEditingController();
    final description = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Publish Notice'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: 'Notice Title'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: description,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Notice Description',
                ),
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
              if (title.text.trim().isEmpty ||
                  description.text.trim().isEmpty) {
                return;
              }

              DemoData.addNotice(
                NoticeModel(
                  title: title.text.trim(),
                  description: description.text.trim(),
                  date: DateTime.now(),
                ),
              );

              Navigator.pop(dialogContext);
            },
            child: const Text('Publish'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Notices')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNotice(context),
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: DemoData.notices,
        builder: (context, notices, _) {
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: notices.length,
            itemBuilder: (context, index) {
              final notice = notices[index];

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.campaign, color: Colors.orange),
                  title: Text(notice.title),
                  subtitle: Text(notice.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      DemoData.deleteNotice(notice);
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
