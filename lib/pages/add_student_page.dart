import 'package:flutter/material.dart';
import '../models/student.dart';

class AddStudentPage extends StatefulWidget {
  final Function(Student) onAdd;

  AddStudentPage({required this.onAdd});

  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            ElevatedButton(
              onPressed: () {
                final newStudent = Student(
                  name: nameController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  location: locationController.text,
                );
                widget.onAdd(newStudent);
                Navigator.pop(context);
              },
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}