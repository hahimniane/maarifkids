import 'package:flutter/material.dart';
import 'package:maarifkids/widgets/navigator_class.dart';

import '../../contants.dart';
import '../../test_page.dart';
import '../admin_module/Health/all_students_with_medication_contol.dart';
import 'custom_nav_bar.dart';
import '../menu_page.dart';

class CustomViewOldPage extends StatelessWidget {
  final TextEditingController gradeController;
  final TextEditingController dateController;
  final String appBarTitleString;
  final Widget nextPage;
  final bool isTitleRequired;
  final bool isItHealthPage;
  final bool shouldAddStudentWithMedicationControl;
  var onPressedStudentsWithMedicationControll;

  CustomViewOldPage(
      {super.key,
      required this.gradeController,
      required this.dateController,
      required this.appBarTitleString,
      required this.nextPage,
      this.isTitleRequired = false,
      this.isItHealthPage = false,
      this.shouldAddStudentWithMedicationControl = false,
      this.onPressedStudentsWithMedicationControll});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: appBarTitleString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: !isItHealthPage
                ? Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: adminAppColor,
                            )),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => nextPage));
                              //TODO: make sure that the user is not empty.
                              //TODO: make sure that the subject is not empty
                              //TODO: make sure that the message is not empty
                              //TODO: check if there is any attachement attached.
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye,
                                      size: 20,
                                      color: adminAppColor,
                                    ),
                                  ],
                                ),
                                Text(
                                  'View',
                                  style: TextStyle(
                                      color: adminAppColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: adminAppColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Text(
                                    'Grade',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ))),
                              Container(
                                width: 210,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: adminAppColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Text(
                                    'Date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ))),
                              Container(
                                  width: 210,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ),
                          isTitleRequired
                              ? Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: adminAppColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                            child: Text(
                                          'Date',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ))),
                                    Container(
                                        width: 210,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ))
                                  ],
                                )
                              : Container()
                        ],
                      )
                    ],
                  )
                : Column(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 60,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: adminAppColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Text(
                                    'Student',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ))),
                              Container(
                                width: 210,
                                child: TextField(
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(
                                    Icons.search,
                                    color: adminAppColor,
                                  )),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          isTitleRequired
                              ? Row(
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: adminAppColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                            child: Text(
                                          'Date',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ))),
                                    Container(
                                        width: 210,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                        ))
                                  ],
                                )
                              : Container()
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                            color: adminAppColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: adminAppColor,
                            )),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => nextPage));
                              //TODO: make sure that the user is not empty.
                              //TODO: make sure that the subject is not empty
                              //TODO: make sure that the message is not empty
                              //TODO: check if there is any attachement attached.
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Text(
                                  'View',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ),
                      shouldAddStudentWithMedicationControl
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: TextButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Adjust the border radius as needed
                                    ),
                                    side: BorderSide(
                                        color:
                                            adminAppColor), // Specify the border color
                                  ),
                                  onPressed: () {
                                    NavigationHelper.pushPage(context,
                                        AllStudentsWithMedicationControlPage());
                                  },
                                  child: Text(
                                    'List Students With medication Control',
                                    style: TextStyle(color: adminAppColor),
                                  )),
                            )
                          : Container()
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
    );
  }
}
