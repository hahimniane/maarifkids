import 'package:flutter/material.dart';

import 'package:maarifkids/contants.dart';
import 'package:maarifkids/widgets/function_for_initializing_dates.dart';

import '../../../widgets/acitvities_class.dart';

import '../../../utils/custom_nav_bar.dart';
import '../../parent_module/Health/saglik_page.dart';
import '../../menu_page.dart';
import '../../utils/custom_delete_functionality.dart';

class AdminHealthDrugControlStudentMedicationResultPage extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  final bool isFromSearch;
  const AdminHealthDrugControlStudentMedicationResultPage(
      {super.key, required this.onDateSelected, required this.isFromSearch});

  @override
  State<AdminHealthDrugControlStudentMedicationResultPage> createState() =>
      _AdminHealthDrugControlStudentMedicationResultPageState();
}

class _AdminHealthDrugControlStudentMedicationResultPageState
    extends State<AdminHealthDrugControlStudentMedicationResultPage> {
  bool checkImageVisible = true;
  bool notAvailableImageVisible = true;
  List<DateTime> dates = [];
  // List<Widget> activities = [];
  List<Widget> myDeneme = [];

  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Health',
        context: context,
        isAdminColor: true,
        isFromSearch: widget.isFromSearch,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileCard(
            isItFromHealthPage: true,
          ),
          Expanded(
            child: CustomActivityList(
              addDividerAtTheBottom: false,
              showDateOnTop: false,
              dates: dates,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              showSearchBar: false,
              selectedDate: selectedDate!,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: myDeneme[dates.indexOf(selectedDate!)],
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

  @override
  void initState() {
    super.initState();
    List<Widget> newList;
    // DateTime selectedDate;
    selectedDate = initializeDates(
        dates: dates, activities: myDeneme, whatToReturnAsAWidget: ToDelete());
  }
}

class ToDelete extends StatefulWidget {
  ToDelete({super.key});

  @override
  State<ToDelete> createState() => _ToDeleteState();
}

class _ToDeleteState extends State<ToDelete> {
  bool editIconStatus = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
          child: Container(
            // color: Colors.blue,
            // height: 100,
            width: 20,
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Card(
                    color: Color(0xfffce5c7),
                    child: Center(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Drug Name:',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: adminAppColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: adminAppColor),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text(
                                'Vitamin',
                                style: TextStyle(
                                    color: adminAppColor, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        CustomTimeWidget(
                          numberOfItems: 4,
                        ),
                        situationStatus(
                          // status: index == 0 ? true : false,
                          editButtonIsActive: editIconStatus,
                          statusText: 'Status',
                        ),
                      ],
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDeleteWidget(
                                  title: "Delete Medication Entry",
                                  content:
                                      'Are you sure you want to delete this Medication Entry?',
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.delete,
                            color: adminAppColor,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              editIconStatus = !editIconStatus;
                              print(
                                  'the edit button status is $editIconStatus');
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            color: adminAppColor,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomTimeWidget extends StatelessWidget {
  final int numberOfItems;

  CustomTimeWidget({Key? key, required this.numberOfItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: numberOfItems,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20, // Adjust the width to change the oval shape
                  height: 10, // Adjust the height to change the oval shape
                  decoration: BoxDecoration(
                    color: adminAppColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the value to change the oval shape
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: adminAppColor),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    hoursInLongFormat[index],
                    style: TextStyle(
                      fontSize: 14,
                      color: adminAppColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

List<String> hoursInLongFormat = [
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
  '19:00',
  '20:00',
  '21:00',
  '22:00',
  '23:00',
];

class situationStatus extends StatefulWidget {
  final bool editButtonIsActive;
  final String statusText;

  const situationStatus({
    Key? key,
    required this.editButtonIsActive,
    required this.statusText,
  });

  @override
  State<situationStatus> createState() => _situationStatusState();
}

class _situationStatusState extends State<situationStatus> {
  bool checkImageVisible = true;
  bool notAvailableImageVisible = true;

  @override
  Widget build(BuildContext context) {
    if (widget.editButtonIsActive) {
      // Both buttons are visible when edit button is active
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.statusText,
              style: TextStyle(
                color: adminAppColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  checkImageVisible = true;
                  notAvailableImageVisible = false;
                });
              },
              child: Image.asset(
                'images/icons/checkIcon.png',
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  checkImageVisible = false;
                  notAvailableImageVisible = true;
                });
              },
              child: Image.asset(
                'images/icons/notAvailableIcon.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      );
    } else {
      // Show only one button based on the initial status
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.statusText,
              style: TextStyle(
                color: adminAppColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 10),
            checkImageVisible
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        checkImageVisible = false;
                        notAvailableImageVisible = true;
                      });
                    },
                    child: Image.asset(
                      'images/icons/checkIcon.png',
                      width: 30,
                      height: 30,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        checkImageVisible = true;
                        notAvailableImageVisible = false;
                      });
                    },
                    child: Image.asset(
                      'images/icons/notAvailableIcon.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
          ],
        ),
      );
    }
  }
}

// class situationStatus extends StatefulWidget {
//   final bool editButtonIsActive;
//   final bool status;
//   const situationStatus(
//       {super.key, required this.status, required this.editButtonIsActive});
//
//   @override
//   State<situationStatus> createState() => _situationStatusState();
// }
//
// class _situationStatusState extends State<situationStatus> {
//   bool notAvailableImageVisible = true;
//
//   bool checkImageVisible = true;
//
//   @override
//   Widget build(BuildContext context) {
//     checkImageVisible = widget.editButtonIsActive ? true : false;
//     notAvailableImageVisible = widget.editButtonIsActive ? true : false;
//     print(widget.editButtonIsActive);
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Situation:  ',
//             style: TextStyle(
//                 color: adminAppColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16),
//           ),
//           // Icon(
//           //   Icons.check,
//           //   color: MainColor,
//           // ),
//
//           widget.editButtonIsActive
//               ? Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Visibility(
//                       visible: checkImageVisible,
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             checkImageVisible = true;
//                             notAvailableImageVisible = false;
//                           });
//                         },
//                         child: Image.asset(
//                           'images/icons/checkIcon.png',
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Visibility(
//                       visible: notAvailableImageVisible,
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             checkImageVisible = false;
//                             notAvailableImageVisible = true;
//                           });
//                         },
//                         child: Image.asset(
//                           'images/icons/notAvailableIcon.png',
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               : GestureDetector(
//                   onTap: () {},
//                   child: widget.status
//                       ? Image.asset(
//                           'images/icons/checkIcon.png',
//                           width: 30,
//                           height: 30,
//                         )
//                       : Image.asset(
//                           'images/icons/notAvailableIcon.png',
//                           width: 30,
//                           height: 30,
//                         ),
//                 ),
//         ],
//       ),
//     );
//   }
// }
