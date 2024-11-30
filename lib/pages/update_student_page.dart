import 'package:flutter/material.dart';
import '../models/student.dart';

class UpdateStudentPage extends StatefulWidget {
  final Student student;
  final Function(Student) onUpdate;

  UpdateStudentPage({required this.student, required this.onUpdate});

  @override
  _UpdateStudentPageState createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.name);
    phoneController = TextEditingController(text: widget.student.phone);
    emailController = TextEditingController(text: widget.student.email);
    locationController = TextEditingController(text: widget.student.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student'),
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
                final updatedStudent = Student(
                  id: widget.student.id,
                  name: nameController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  location: locationController.text,
                );
                widget.onUpdate(updatedStudent);
                Navigator.pop(context);
              },
              child: Text('Update Student'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}