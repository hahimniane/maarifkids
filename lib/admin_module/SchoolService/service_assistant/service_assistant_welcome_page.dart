import 'package:flutter/material.dart';
import 'package:maarifkids/admin_module/SchoolService/service_assistant/service_assistant_student_service_result_page.dart';

import '../../../menu_page.dart';
import '../../../services/navigator_class.dart';
import '../../../utils/contants.dart';
import '../../../utils/custom_nav_bar.dart';
import '../admin_service_student_service_result_page.dart';

class ServiceAssistantWelcomePage extends StatelessWidget {
  const ServiceAssistantWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: schoolServiceString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: adminAppColor,
                      )),
                  child: TextButton(
                      onPressed: () {
                        NavigationHelper.pushPage(context,
                            AdminServiceAssistantServiceStudentServiceResultPage());
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
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
                Expanded(
                  child: SizedBox(
                    width: 15,
                  ),
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
                              'Group',
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
                            ))
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
                  ],
                )
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
          }
        },
      ),
    );
  }
}
