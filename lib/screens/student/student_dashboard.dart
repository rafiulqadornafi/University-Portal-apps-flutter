import 'package:flutter/material.dart';

import '../../widgets/dashboard_card.dart';
import '../login_screen.dart';

import 'notice_screen.dart';
import 'routine_screen.dart';
import 'result_screen.dart';
import 'attendance_screen.dart';
import 'fees_screen.dart';
import 'profile_screen.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        backgroundColor: const Color(0xFF0759D3),
        foregroundColor: Colors.white,
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
            // Student Profile Header

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
                  // Student Profile Picture

                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),

                  SizedBox(height: 15),

                  // Student Name
                  Text(
                    'Hi, Rafiul Qador Nafi!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Student Information
                  Text(
                    'ID: STU1001 | AIUB (CSE)',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Quick Access Title
            const Text(
              'Quick Access',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            // Dashboard Cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.25,

              children: [
                DashboardCard(
                  title: 'Notice Board',
                  icon: Icons.campaign,
                  color: Colors.pink,
                  onTap: () => openPage(context, const NoticeScreen()),
                ),

                DashboardCard(
                  title: 'Class Routine',
                  icon: Icons.calendar_month,
                  color: Colors.blue,
                  onTap: () => openPage(context, const RoutineScreen()),
                ),

                DashboardCard(
                  title: 'Exam Result',
                  icon: Icons.bar_chart,
                  color: Colors.green,
                  onTap: () => openPage(context, const ResultScreen()),
                ),

                DashboardCard(
                  title: 'Attendance',
                  icon: Icons.fact_check,
                  color: Colors.orange,
                  onTap: () => openPage(context, const AttendanceScreen()),
                ),

                DashboardCard(
                  title: 'Fees',
                  icon: Icons.payments,
                  color: Colors.purple,
                  onTap: () => openPage(context, const FeesScreen()),
                ),

                DashboardCard(
                  title: 'My Profile',
                  icon: Icons.person,
                  color: Colors.teal,
                  onTap: () => openPage(context, const ProfileScreen()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
