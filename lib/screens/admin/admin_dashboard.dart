import 'package:flutter/material.dart';

import '../../widgets/dashboard_card.dart';
import '../../data/demo_data.dart';
import '../login_screen.dart';

import 'manage_students.dart';
import 'manage_teachers.dart';
import 'manage_notices.dart';
import 'manage_results.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (_) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0759D3), Color(0xFF6546D7)],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, Admin!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Manage your institution easily',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Overview',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            ValueListenableBuilder(
              valueListenable: DemoData.students,
              builder: (context, students, _) {
                return ValueListenableBuilder(
                  valueListenable: DemoData.teachers,
                  builder: (context, teachers, _) {
                    return Row(
                      children: [
                        Expanded(
                          child: _statCard(
                            'Students',
                            '${students.length}',
                            Icons.people,
                            Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _statCard(
                            'Teachers',
                            '${teachers.length}',
                            Icons.school,
                            Colors.purple,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 28),

            const Text(
              'Management',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.25,
              children: [
                DashboardCard(
                  title: 'Students',
                  icon: Icons.people,
                  color: Colors.blue,
                  onTap: () => openPage(context, const ManageStudents()),
                ),
                DashboardCard(
                  title: 'Teachers',
                  icon: Icons.school,
                  color: Colors.purple,
                  onTap: () => openPage(context, const ManageTeachers()),
                ),
                DashboardCard(
                  title: 'Notices',
                  icon: Icons.campaign,
                  color: Colors.orange,
                  onTap: () => openPage(context, const ManageNotices()),
                ),
                DashboardCard(
                  title: 'Results',
                  icon: Icons.bar_chart,
                  color: Colors.green,
                  onTap: () => openPage(context, const ManageResults()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 35),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Text(title),
        ],
      ),
    );
  }
}
