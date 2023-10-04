import 'package:flutter/material.dart';
import 'package:maarifkids/utils/contants.dart';

import '../../menu_page.dart';
import '../../utils/custom_date_picker.dart';
import '../../utils/custom_nav_bar.dart';

class AllStudentsWithMedicationControlPage extends StatefulWidget {
  @override
  _AllStudentsWithMedicationControlPageState createState() =>
      _AllStudentsWithMedicationControlPageState();
}

class _AllStudentsWithMedicationControlPageState
    extends State<AllStudentsWithMedicationControlPage> {
  DateTime _selectedDate = DateTime.now();
  bool _isPresent = false;
  Map<String, bool> _presenceMap = {
    '12345': false, // studentNumber: isPresent
    '67890': false,
    '11111': false,
    '22222': false,

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
        title: healthString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: adminAppColor,
                      borderRadius: BorderRadius.circular(5)
                      // border: Border.all(
                      //   // color: Colors.black, // You can set the border color here.
                      //   width: 1, // You can set the border width here.
                      // ),
                      ),
                  child: Text(
                    'Student:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: adminAppColor,
                      ),
                      hintText: 'Enter Student Number',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(alignment: Alignment.center, child: DateSelectionWidget()),
            SizedBox(height: 10),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  Student student = _students[index];
                  return ListTile(
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
                      trackOutlineColor: MaterialStateProperty.resolveWith ((Set  states) {
                        print('in here');
                        if (states.contains(MaterialState.disabled)) {

                          return Colors.red;
                        }
                        return Colors.teal; // Use the default color.
                      }),

                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.red,
                      activeTrackColor: Colors.teal,
                      activeColor: Colors.white,

                      value: _presenceMap[student.studentNumber] ?? false,
                      onChanged: (value) {
                        setState(() {
                          _presenceMap[student.studentNumber] = value;
                          // Handle presence toggle logic here
                        });
                      },
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
    ;
  }
}

class Student {
  final String name;
  final String studentNumber;

  Student({required this.name, required this.studentNumber});
}
