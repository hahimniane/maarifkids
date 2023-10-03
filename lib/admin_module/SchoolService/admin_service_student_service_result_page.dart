import 'package:flutter/material.dart';

import '../../services/navigator_class.dart';
import '../../utils/contants.dart';
import '../../menu_page.dart';
import '../../parent_module/Attendance/attendance_page.dart';
import '../../parent_module/Service/service_page.dart';
import '../../utils/search_functionality.dart';
import '../../utils/custom_nav_bar.dart';
import 'admin_service_single_student_details_page.dart';

class Student {
  String name;
  int schoolNumber;
  bool gotOnBus;
  bool enteredSchool;
  bool enteredHome;

  Student(
      {required this.name,
      required this.schoolNumber,
      this.gotOnBus = false,
      this.enteredSchool = false,
      this.enteredHome = false});
}

class AdminServiceStudentServiceResultPage extends StatefulWidget {
  const AdminServiceStudentServiceResultPage({super.key});

  @override
  _AdminServiceStudentServiceResultPageState createState() =>
      _AdminServiceStudentServiceResultPageState();
}

class _AdminServiceStudentServiceResultPageState
    extends State<AdminServiceStudentServiceResultPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Student> studentsGoingHome;
  late List<Student> studentsGoingToSchool;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    studentsGoingToSchool = [
      Student(
          name: "Student 1",
          schoolNumber: 101,
          gotOnBus: true,
          enteredSchool: false),
      Student(
          name: "Student 2",
          schoolNumber: 102,
          gotOnBus: true,
          enteredSchool: true),
      Student(
          name: "Student 3",
          schoolNumber: 103,
          gotOnBus: false,
          enteredSchool: true),
      Student(
          name: "Student 4",
          schoolNumber: 104,
          gotOnBus: false,
          enteredSchool: false),
      Student(
          name: "Student 5",
          schoolNumber: 105,
          gotOnBus: true,
          enteredSchool: false),
      Student(
          name: "Student 6",
          schoolNumber: 106,
          gotOnBus: true,
          enteredSchool: true),
      Student(
          name: "Student 7",
          schoolNumber: 107,
          gotOnBus: true,
          enteredSchool: true),
      Student(
          name: "Student 8",
          schoolNumber: 108,
          gotOnBus: false,
          enteredSchool: false),
      Student(
          name: "Student 9",
          schoolNumber: 109,
          gotOnBus: true,
          enteredSchool: false),
      Student(
          name: "Student 10",
          schoolNumber: 110,
          gotOnBus: false,
          enteredSchool: false),
    ];
    studentsGoingHome = [
      Student(
          name: "Student 1",
          schoolNumber: 101,
          gotOnBus: true,
          enteredHome: false),
      Student(
          name: "Student 2",
          schoolNumber: 102,
          gotOnBus: true,
          enteredHome: true),
      Student(
        name: "Student 3",
        schoolNumber: 103,
        gotOnBus: false,
        enteredHome: true,
      ),
      Student(
        enteredHome: true,
        name: "Student 4",
        schoolNumber: 104,
        gotOnBus: false,
      ),
      Student(
        enteredHome: true,
        name: "Student 5",
        schoolNumber: 105,
        gotOnBus: true,
      ),
      Student(
        enteredHome: true,
        name: "Student 6",
        schoolNumber: 106,
        gotOnBus: true,
      ),
      Student(
        enteredHome: true,
        name: "Student 7",
        schoolNumber: 107,
        gotOnBus: true,
      ),
      Student(
        enteredHome: true,
        name: "Student 8",
        schoolNumber: 108,
        gotOnBus: false,
      ),
      Student(
        enteredHome: true,
        name: "Student 9",
        schoolNumber: 109,
        gotOnBus: true,
      ),
      Student(
        enteredHome: true,
        name: "Student 10",
        schoolNumber: 110,
        gotOnBus: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(
          title: schoolServiceString,
          context: context,
          isFromSearch: false,
          isAdminColor: true,
        ),
        body: Column(
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
            SizedBox(
              height: 10,
            ),
            TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              unselectedLabelColor: adminAppColor,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicator: BoxDecoration(
                  color: adminAppColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: adminAppColor)),
              controller: _tabController,
              tabs: [
                Tab(text: 'SCHOOL'),
                Tab(text: 'HOME'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildStudentList(goingToSchool: true),
                  buildHomeStudentList(goingToHome: true),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: 0,
          onTap: (int value) {
            if (value == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuPage()));
            } else if (value == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchFieldSample()));
            }
          },
        ),
      ),
    );
  }

  Widget buildStudentList({required bool goingToSchool}) {
    return ListView.builder(
      itemCount: studentsGoingToSchool.length,
      itemBuilder: (context, index) {
        Student student = studentsGoingToSchool[index];
        String busStatus = student.gotOnBus
            ? 'Student got on the bus'
            : 'Student didn\'t get on the bus';
        String schoolStatus = student.enteredSchool
            ? 'Student entered the school successfully'
            : 'Student didn\'t enter the school';

        return GestureDetector(
          onTap: () {
            NavigationHelper.pushPage(
                context,
                ServicePage(
                  isFromSearch: false,
                ));
          },
          child: Card(
            elevation: 2,
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: adminAppColor,
              ),
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      "${student.name} ",
                      style: TextStyle(
                          color: adminAppColor, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(student.schoolNumber.toString(),
                        style: TextStyle(
                            color: adminAppColor, fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              busStatus,
                              style: TextStyle(
                                  color: student.gotOnBus
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ),
                          Expanded(
                            child: student.gotOnBus
                                ? Icon(
                                    Icons.verified,
                                    color: Colors.greenAccent,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      ),
                      // Text(
                      //   busStatus,
                      //   style: TextStyle(
                      //       color: student.gotOnBus ? Colors.green : Colors.red),
                      // ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              schoolStatus,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: student.enteredSchool
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ),
                          Expanded(
                            child: student.enteredSchool
                                ? Icon(
                                    Icons.verified,
                                    color: Colors.greenAccent,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      ),
                      // Text(
                      //   schoolStatus,
                      //   style: TextStyle(
                      //       color: student.enteredSchool
                      //           ? Colors.green
                      //           : Colors.red),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildHomeStudentList({required bool goingToHome}) {
    // List<Student> filteredStudents = studentsGoingHome
    //     .where(
    //         (student) => (!goingToHome ? student.gotOnBus : !student.gotOnBus))
    //     .toList();

    return ListView.builder(
      itemCount: studentsGoingHome.length,
      itemBuilder: (context, index) {
        Student student = studentsGoingHome[index];
        String busStatus = student.gotOnBus
            ? 'Student got on the bus'
            : 'Student didn\'t get on the bus';
        String homeStatus = goingToHome
            ? (student.enteredHome
                ? 'Student reached home successfully'
                : 'Student didn\'t get on the bus to go home')
            : '';

        return Card(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    "${student.name} ",
                    style: TextStyle(
                        color: adminAppColor, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(student.schoolNumber.toString(),
                      style: TextStyle(
                          color: adminAppColor, fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            busStatus,
                            style: TextStyle(
                                color: student.gotOnBus
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ),
                        Expanded(
                          child: student.gotOnBus
                              ? Icon(
                                  Icons.verified,
                                  color: Colors.greenAccent,
                                )
                              : Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            homeStatus,
                            style: TextStyle(
                                color: student.gotOnBus
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ),
                        Expanded(
                          child: student.enteredHome
                              ? Icon(
                                  Icons.verified,
                                  color: Colors.greenAccent,
                                )
                              : Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
