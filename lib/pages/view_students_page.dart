import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'update_student_page.dart';
import '../models/student.dart';
import '../services/database_service.dart';

class ViewStudentsPage extends StatefulWidget {
  @override
  _ViewStudentsPageState createState() => _ViewStudentsPageState();
}

class _ViewStudentsPageState extends State<ViewStudentsPage> {
  DatabaseService dbService = DatabaseService();
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    final List<Student> studentsList = await dbService.getStudents();
    setState(() {
      students = studentsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Students'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text(student.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateStudentPage(
                              student: student,
                              onUpdate: (updatedStudent) async {
                                await dbService.updateStudent(updatedStudent);
                                loadStudents();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await dbService.deleteStudent(student.id!);
                        loadStudents();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.grey,
    );
  }
}