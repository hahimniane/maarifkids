import 'package:flutter/material.dart';
import 'package:maarifkids/contants.dart';
import 'package:maarifkids/widgets/navigator_class.dart';

import '../../menu_page.dart';
import '../../utils/custom_nav_bar.dart';
import '../Health/all_students_with_medication_contol.dart';
import 'admin_attendance_student_details_page.dart';

class AdminAttendenceResultPage extends StatefulWidget {
  const AdminAttendenceResultPage({super.key});

  @override
  State<AdminAttendenceResultPage> createState() =>
      _AdminAttendenceResultPageState();
}

class _AdminAttendenceResultPageState extends State<AdminAttendenceResultPage> {
  DateTime _selectedDate = DateTime.now();
  bool _isPresent = false;
  Map<String, bool> _presenceMap = {
    '12345': true, // studentNumber: isPresent
    '67890': true,
    '11111': true,
    '22222': true,

    // Add more students as needed
  };

  List<Student> _students = [
    Student(name: 'John Doe', studentNumber: '12345'),
    Student(name: 'Alice Smith', studentNumber: '67890'),
    Student(name: 'John Doe', studentNumber: '11111'),
    Student(name: 'Alice Smith', studentNumber: '22222'),
    // Add more students as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: attendanceString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 85,
              height: 35,
              decoration: BoxDecoration(
                  color: adminAppColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Cass A',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            CustomDatePicker(),
            Expanded(
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  Student student = _students[index];
                  return GestureDetector(
                    onTap: () {
                      NavigationHelper.pushPage(
                          context,
                          AdminAttendanceStudentDetailsPage(
                            isFromSearch: false,
                          ));
                    },
                    child: ListTile(
                      title: Text(
                        student.name,
                        style: TextStyle(
                            color: adminAppColor, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Student Number: ${student.studentNumber}',
                        style: TextStyle(color: adminAppColor),
                      ),
                      trailing: Switch(
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.red,
                        activeTrackColor: adminAppColor,
                        activeColor: Colors.white,
                        value: _presenceMap[student.studentNumber] ?? false,
                        onChanged: (value) {
                          setState(() {
                            _presenceMap[student.studentNumber] = value;
                            // Handle presence toggle logic here
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          }
        },
      ),
    );
  }
}
