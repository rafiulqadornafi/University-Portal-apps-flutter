import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'admin/admin_dashboard.dart';
import 'student/student_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isAdmin = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    final username = usernameController.text.trim();
    final password = passwordController.text;

    final valid = isAdmin
        ? username == 'admin' && password == '123456'
        : username == 'student' && password == '123456';

    if (!valid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            isAdmin ? const AdminDashboard() : const StudentDashboard(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // AIUB University Logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 130,
                  width: 130,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 18),

                // University Name
                const Text(
                  'American International University-Bangladesh',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0759D3),
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  '(AIUB)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6546D7),
                  ),
                ),

                const SizedBox(height: 18),

                // Application Name
                const Text(
                  'SMART UNIVERSITY PORTAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF14213D),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Welcome Back!',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),

                const SizedBox(height: 35),

                // Student and Admin Selection
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: ChoiceChip(
                          label: const Text('Student'),
                          selected: !isAdmin,
                          onSelected: (_) {
                            setState(() {
                              isAdmin = false;
                            });
                          },
                        ),
                      ),

                      Expanded(
                        child: ChoiceChip(
                          label: const Text('Admin'),
                          selected: isAdmin,
                          onSelected: (_) {
                            setState(() {
                              isAdmin = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Student ID / Admin Username
                CustomTextField(
                  label: isAdmin ? 'Admin Username' : 'Student ID',

                  icon: Icons.person_outline,
                  controller: usernameController,
                ),

                const SizedBox(height: 18),

                // Password Field
                CustomTextField(
                  label: 'Password',
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                // Login Button
                CustomButton(text: 'Login', onPressed: login),

                const SizedBox(height: 20),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
