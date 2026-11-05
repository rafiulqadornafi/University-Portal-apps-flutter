import 'package:flutter/material.dart';

import '../../data/demo_data.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notice Board')),
      body: ValueListenableBuilder(
        valueListenable: DemoData.notices,
        builder: (context, notices, _) {
          if (notices.isEmpty) {
            return const Center(child: Text('No notices available'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: notices.length,
            itemBuilder: (context, index) {
              final notice = notices[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.campaign, color: Colors.orange),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              notice.title,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(notice.description),
                      const SizedBox(height: 10),
                      Text(
                        '${notice.date.day}/'
                        '${notice.date.month}/'
                        '${notice.date.year}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
