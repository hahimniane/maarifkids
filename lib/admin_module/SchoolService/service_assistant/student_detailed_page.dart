import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:maarifkids/utils/contants.dart';

import '../../../menu_page.dart';
import '../../../parent_module/Attendance/attendance_page.dart';
import '../../../parent_module/Health/saglik_page.dart';
import '../../../utils/custom_nav_bar.dart';

class AssistantStudentDetailedServicePage extends StatelessWidget {
  final bool isFromSearch;
  const AssistantStudentDetailedServicePage(
      {super.key, required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor == adminAppColor
          ? adminPageBackgroundColor.withOpacity(0.9)
          : profileSecimiBackgroundColor,
      appBar: buildAppBar(
        isAdminColor:
            Theme.of(context).primaryColor == adminAppColor ? true : false,
        title: schoolServiceString,
        context: context,
        isFromSearch: isFromSearch,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Card(
                  elevation: 0.5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Profile Photo
                            const CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  AssetImage('images/yavuz_selim.jpeg'),
                            ),
                            const SizedBox(width: 10.0),

                            // Profile Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yavuz Selim CelikTas',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 2.0),
                                  Center(
                                    child: Text(
                                      '(Student)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      AutoSizeText(
                                        'Driver: ',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      AutoSizeText(
                                        'Hashim Niane -0554-152-4',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      // Expanded(child: SizedBox(width: 16.0)),
                                      // Text(
                                      //   'Number Plate: ',
                                      //   style: TextStyle(
                                      //     fontSize: 15.0,
                                      //     color: Theme.of(context).primaryColor,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      // Text(
                                      //   '30 kg',
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     color: Theme.of(context).primaryColor,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(height: 1.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Number plate:',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '34 GS 1905',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.0),
                                  Row(
                                    children: [
                                      Text(
                                        'Group:',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'B',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 3,
                  thickness: 4,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          DatePickerWidget(),
          Expanded(
            child: SafeArea(
              top: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36.0, vertical: 8),
                child: Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(110)),
                  child: Card(
                    elevation: 0.5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Going To School',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Did he get on the school bus?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Image.asset(
                                'images/icons/checkIcon.png',
                                height: 35,
                                width: 35,
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Did he go to school?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Image.asset(
                                'images/icons/checkIcon.png',
                                height: 35,
                                width: 35,
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Returning Home',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                'Did he get on the school bus?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Image.asset(
                                'images/icons/notAvailableIcon.png',
                                height: 35,
                                width: 35,
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Has he been handed over to the parent?',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  width: 02,
                                ),
                              ),
                              Image.asset(
                                'images/icons/notAvailableIcon.png',
                                height: 35,
                                width: 35,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: ' Missed: ',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: '4',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
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
