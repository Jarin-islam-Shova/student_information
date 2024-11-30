import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'add_student_page.dart';
import 'view_students_page.dart';
import '../services/database_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseService dbService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Information App'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddStudentPage(
                          onAdd: (newStudent) async {
                            await dbService.insertStudent(newStudent);
                            setState(() {}); // Refresh the state to reflect changes
                          },
                        ),
                      ),
                    );
                  },
                  child: Text('Add Student'),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewStudentsPage(),
                      ),
                    );
                  },
                  child: Text('View All Students'),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}