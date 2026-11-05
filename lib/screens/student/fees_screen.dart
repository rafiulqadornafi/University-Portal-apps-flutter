import 'package:flutter/material.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fees Information')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
              title: Text('Total Fees'),
              trailing: Text('৳ 12,000'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Paid Amount'),
              trailing: Text('৳ 8,000'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.warning_amber, color: Colors.orange),
              title: Text('Due Amount'),
              trailing: Text('৳ 4,000'),
            ),
          ),
        ],
      ),
    );
  }
}
