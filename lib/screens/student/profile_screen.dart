import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile'), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // PROFILE PICTURE
            Center(
              child: Container(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF0759D3), width: 3),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile1.jpg',
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) {
                      debugPrint('Profile image error: $error');

                      return Container(
                        color: Colors.blue,
                        child: const Icon(
                          Icons.person,
                          size: 65,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // STUDENT NAME
            const Text(
              'Rafiul Qador Nafi',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF14213D),
              ),
            ),

            const SizedBox(height: 8),

            // STUDENT ID
            const Text(
              'Student ID: STU1001',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 25),

            // STUDENT INFORMATION
            _info('Department', 'CSE'),
            _info('Section', 'pending'),
            _info('Email', 'nafi@example.com'),
            _info('Institution', 'AIUB'),
            _info('Status', 'Active'),
          ],
        ),
      ),
    );
  }

  Widget _info(String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF14213D),
          ),
        ),
      ),
    );
  }
}
