import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:maarifkids/utils/contants.dart';

import '../../parent_module/Health/saglik_page.dart';
import '../../services/acitvities_class.dart';
import '../../services/function_for_initializing_dates.dart';
import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';
import '../../utils/search_functionality.dart';

class AdminHealthAddNewPillPage extends StatefulWidget {
  final bool isFromSearch;
  const AdminHealthAddNewPillPage({super.key, required this.isFromSearch});

  @override
  _AdminHealthAddNewPillPageState createState() =>
      _AdminHealthAddNewPillPageState();
}

class _AdminHealthAddNewPillPageState extends State<AdminHealthAddNewPillPage> {
  List<DateTime> dates = [];
  List<Widget> activities = [];

  DateTime? selectedDate;

  int currentIndex = 0;

  bool showSearchBar = false;

  bool bottomModalIsActive = false;

  TextEditingController textController = TextEditingController();

  void _onTabTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    } else if (index == 1) {
      print('in here');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchFieldSample()),
      );
      setState(() {
        showSearchBar = true;
      });
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    // DateTime selectedDate;
    selectedDate = initializeDates(
        dates: dates,
        activities: activities,
        whatToReturnAsAWidget: CreateEvent());
    // this.selectedDate = selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: healthString,
        context: context,
        isFromSearch: widget.isFromSearch,
      ),
      // buildAppBar('Etkinlik Sayfasi', context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileCard(
            isItFromHealthPage: true,
          ),
          Expanded(
            flex: 2,
            child: CustomActivityList(
              addDividerAtTheBottom: false,
              showDateOnTop: false,
              dates: dates,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              showSearchBar: showSearchBar,
              selectedDate: selectedDate!,
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: activities[dates.indexOf(selectedDate!)],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  void _openSearchTab() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            child: Text('Hello'),
            // Search tab content goes here
          ),
        );
      },
    ).whenComplete(() {
      setState(() {
        showSearchBar = false;
      });
    });
  }
}

class EventSlot {
  String selectedTime;
  String eventDetails;

  EventSlot(this.selectedTime, this.eventDetails);
}

class CreateEvent extends StatefulWidget {
  const CreateEvent({
    super.key,
  });

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  List<Map<String, String>> eventSlots = []; // List to store event slots
  String? selectedTime = '12:00';
  int slotId = 0;

  bool hasUnsavedChanges = false;

  bool hasEmptyDetails = true;
  // Unique identifier for each slot

  List<String> generateTimeOptions() {
    List<String> timeOptions = [];
    for (int hour = 0; hour < 24; hour++) {
      for (int minute = 0; minute < 60; minute += 15) {
        // Create time strings in HH:mm format
        String hourStr = hour.toString().padLeft(2, '0');
        String minuteStr = minute.toString().padLeft(2, '0');
        timeOptions.add('$hourStr:$minuteStr');
      }
    }
    return timeOptions;
  }

  void addSlot() {
    print('adding a new slot and slot id is $slotId ');
    setState(() {
      // Add a new slot with a unique identifier
      eventSlots.add({
        'id': slotId.toString(),
        'selectedTime': selectedTime!,
        'eventDetails': '',
      });
      slotId++; // Increment the unique identifier
    });
  }

  void removeSlot(String id) {
    setState(() {
      // Remove the slot with the given unique identifier
      eventSlots.removeWhere((slot) => slot['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> timeList = generateTimeOptions();
    List<Widget> slotWidgets = eventSlots.map((slot) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 5, left: 16),
        child: Container(
          height: 100,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.yellow,
                  height: 50,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 38,
                        child: TextField(
                          decoration: InputDecoration(
                            focusColor: Colors.green,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: hasEmptyDetails &&
                                      slot['eventDetails']!.isEmpty
                                  ? Colors.red
                                  : adminAppColor,
                            )),
                            hintStyle: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                            hintText:
                                hasEmptyDetails && slot['eventDetails']!.isEmpty
                                    ? 'Enter Name...'
                                    : '',
                            helperStyle: TextStyle(height: 0),
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.purple,
                                )),
                          ),
                          onChanged: (newValue) {
                            // Update event details when the text field changes
                            slot['eventDetails'] = newValue;
                          },
                        ),
                      ),
                      Positioned(
                        top: -25,
                        right: -24,
                        child: IconButton(
                          icon: Icon(Icons.cancel,
                              size: 15, color: adminAppColor),
                          onPressed: () {
                            print(
                                'the slot I am in right now is ${slot['id']}');

                            removeSlot(slot[
                                'id']!); // Remove the slot when the icon is clicked
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                        height: 33,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: adminAppColor,
                        ),
                        child: Center(
                            child: Text(
                          'Time',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: adminAppColor),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: SizedBox.shrink(),
                          value: slot['selectedTime'],
                          onChanged: (newValue) {
                            setState(() {
                              slot['selectedTime'] = newValue!;
                            });
                          },
                          items: timeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                child: Text(
                                  value,
                                  style: TextStyle(color: adminAppColor),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    TextButton(
                      child: Text('Add'),
                      onPressed: () {
                        addTimeSlot();
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      );
    }).toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...slotWidgets,
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: TextButton(
                onPressed: () {
                  addSlot();
                },
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.pills,
                      color: adminAppColor,
                    ),
                    Text(
                      'Add Drug',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: adminAppColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.047,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: adminAppColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  hasEmptyDetails =
                      eventSlots.any((slot) => slot['eventDetails']!.isEmpty);
                  print('the has empty details is $hasEmptyDetails');
                  if (eventSlots.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: adminAppColor,
                          title: Text("No Events Created"),
                          titleTextStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          content: Text("You have not created any events."),
                          contentTextStyle: TextStyle(color: Colors.white),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "OK",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (hasEmptyDetails) {
                    setState(() {
                      eventSlots.forEach((slot) {
                        if (slot['eventDetails']!.isEmpty) {
                          slot['validationError'] =
                              'Event details cannot be empty';
                        } else {
                          slot.remove('validationError');
                        }
                      });
                    });
                  } else {
                    setState(() {
                      hasUnsavedChanges = false;
                    });
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    eventSlots.add({
      'id': slotId.toString(),
      'selectedTime': selectedTime!,
      'eventDetails': '',
      'mandatory': 'true', // Add a 'mandatory' key to mark it as mandatory
    });
    slotId++;
  }

  void addTimeSlot() {}
}

// class _CreateEventState extends State<CreateEvent> {
//   List<EventSlot> eventSlots = []; // List to store event slots
//   String? selectedTime = '12:00';
//   List<String> generateTimeOptions() {
//     List<String> timeOptions = [];
//     for (int hour = 0; hour < 24; hour++) {
//       for (int minute = 0; minute < 60; minute += 15) {
//         // Create time strings in HH:mm format
//         String hourStr = hour.toString().padLeft(2, '0');
//         String minuteStr = minute.toString().padLeft(2, '0');
//         timeOptions.add('$hourStr:$minuteStr');
//       }
//     }
//     return timeOptions;
//   }
//
//   void addSlot() {
//     setState(() {
//       eventSlots.add(
//           EventSlot(selectedTime!, '')); // Add a new slot with selected time
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> timeList = generateTimeOptions();
//     List<Widget> slotRows = eventSlots.map((slot) {
//       return Padding(
//         padding: const EdgeInsets.only(top: 16.0, bottom: 5, left: 16),
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 height: 30,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: adminAppColor),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     icon: SizedBox.shrink(),
//                     value: slot.selectedTime,
//                     onChanged: (newValue) {
//                       setState(() {
//                         slot.selectedTime = newValue!;
//                       });
//                     },
//                     items:
//                         timeList.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Center(
//                           child: Text(
//                             value,
//                             style: TextStyle(color: adminAppColor),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               flex: 3,
//               child: Container(
//                 height: 30,
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.zero,
//                         border: OutlineInputBorder(),
//                       ),
//                       onChanged: (newValue) {
//                         // Update event details when the text field changes
//                         slot.eventDetails = newValue;
//                       },
//                     ),
//                     Positioned(
//                       top: -25,
//                       right: -24,
//                       child: IconButton(
//                         icon: Icon(Icons.cancel,size: 15,color: adminAppColor,),
//                         onPressed: () {
//
//                           slot.eventDetails = '';
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//
//           ],
//         ),
//       );
//     }).toList();
//
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ListTile(
//             title: Container(
//                 width: 60,
//                 height: 30,
//                 decoration: BoxDecoration(
//                     color: adminAppColor,
//                     borderRadius: BorderRadius.circular(8)),
//                 child: Center(
//                     child: Text(
//                   gradeString,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ))),
//             trailing: Container(
//                 width: 210,
//                 child: TextField(
//                   decoration: InputDecoration(
//                       hintText: 'Class A',
//                       hintStyle: TextStyle(
//                         color: adminAppColor,
//                         decoration: TextDecoration.underline,
//                       )
//                       // label: Text(  ),
//                       ),
//                   textAlign: TextAlign.center,
//                 )),
//           ),
//           ListTile(
//             title: Container(
//                 width: 60,
//                 height: 30,
//                 decoration: BoxDecoration(
//                     color: adminAppColor,
//                     borderRadius: BorderRadius.circular(8)),
//                 child: Center(
//                     child: Text(
//                   dateString,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                   ),
//                 ))),
//             trailing: Container(
//                 width: 210,
//                 child: TextField(
//                   decoration: InputDecoration(
//                       hintStyle: TextStyle(color: adminAppColor),
//                       hintText:
//                           '${DateFormat.MMMMEEEEd().format(DateTime.now())}'
//                       // label: Text(  ),
//                       ),
//                   textAlign: TextAlign.center,
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0, bottom: 12, left: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                     'Time',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: adminAppColor),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: Center(
//                     child: Text(
//                       'Event',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: adminAppColor),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             // child: ListTile(
//             //   leading: Text('Hour'),
//             //
//             // ),
//           ),
//           // ...slotRows,
//           ListView.builder(
//             shrinkWrap: true,
//               itemCount: slotRows.length,
//               itemBuilder: (context,index){
//
//             return slotRows[index];
//           }),
//           Container(
//             child: TextButton(
//               onPressed: () {
//                 addSlot();
//               },
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.add,
//                     color: adminAppColor,
//                   ),
//                   Text(
//                     'Add',
//                     style: TextStyle(
//                       color: adminAppColor,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: Container(
//               height: MediaQuery.of(context).size.height*0.047,
//               decoration: BoxDecoration(
//
//                 borderRadius: BorderRadius.circular(10)
//               ),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//
//                   backgroundColor: adminAppColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero, // Zero border radius creates a rectangular button
//                   ),
//                 ),
//                 onPressed: () {
//                   // addSlot();
//                 },
//                 child: Text(
//                   'Save',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
