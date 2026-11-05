import 'package:flutter/foundation.dart';

import '../models/student_model.dart';
import '../models/notice_model.dart';

class DemoData {
  static final ValueNotifier<List<StudentModel>> students = ValueNotifier([
    StudentModel(
      id: 'STU1001',
      name: 'Rahim Hossain',
      studentClass: '12',
      section: 'Science',
      email: 'rahim@example.com',
    ),
    StudentModel(
      id: 'STU1002',
      name: 'Karim Ahmed',
      studentClass: '11',
      section: 'Science',
      email: 'karim@example.com',
    ),
  ]);

  static final ValueNotifier<List<String>> teachers = ValueNotifier([
    'Abdul Karim - Mathematics',
    'Nusrat Jahan - English',
    'Hasan Mahmud - Physics',
  ]);

  static final ValueNotifier<List<NoticeModel>> notices = ValueNotifier([
    NoticeModel(
      title: 'Welcome to Smart Student Portal',
      description: 'Welcome to our new student portal.',
      date: DateTime.now(),
    ),
    NoticeModel(
      title: 'Exam Notice',
      description: 'The examination schedule will be published soon.',
      date: DateTime.now(),
    ),
  ]);

  static final ValueNotifier<List<String>> results = ValueNotifier([
    'Mathematics - A+',
    'English - A',
    'Physics - A+',
    'Chemistry - A',
  ]);

  static void addStudent(StudentModel student) {
    students.value = [...students.value, student];
  }

  static void deleteStudent(String id) {
    students.value = students.value.where((s) => s.id != id).toList();
  }

  static void addTeacher(String teacher) {
    teachers.value = [...teachers.value, teacher];
  }

  static void deleteTeacher(String teacher) {
    teachers.value = teachers.value.where((t) => t != teacher).toList();
  }

  static void addNotice(NoticeModel notice) {
    notices.value = [notice, ...notices.value];
  }

  static void deleteNotice(NoticeModel notice) {
    notices.value = notices.value.where((n) => n != notice).toList();
  }

  static void addResult(String result) {
    results.value = [...results.value, result];
  }
}
