import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maarifkids/Pages/Components/attendance_page.dart';
import 'package:maarifkids/contants.dart';

import '../../Pages/Components/Etkinlik_program_page.dart';
import '../../Pages/Components/custom_nav_bar.dart';
import '../../Pages/Components/food_page.dart';
import '../../Pages/menu_page.dart';
import '../../test_page.dart';
import '../../widgets/acitvities_class.dart';
import '../../widgets/function_for_initializing_dates.dart';
import '../../widgets/function_to_display_what_happens_depending_on_the_date_selected.dart';

class AdminAddNewEventPage extends StatefulWidget {
  final bool isFromSearch;
  const AdminAddNewEventPage({super.key, required this.isFromSearch});

  @override
  _AdminAddNewEventPageState createState() => _AdminAddNewEventPageState();
}

class _AdminAddNewEventPageState extends State<AdminAddNewEventPage> {
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
    List<Widget> newList;
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
        title: eventProgramString,
        context: context,
        isFromSearch: widget.isFromSearch,
      ),
      // buildAppBar('Etkinlik Sayfasi', context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: CustomActivityList(
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

          // Padding(
          //   padding: const EdgeInsets.only(top: 16.0, bottom: 12, left: 16),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Text(
          //           'Hour',
          //           style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //               color: parentAppColor),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 4,
          //         child: Center(
          //           child: Text(
          //             'Event',
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.bold,
          //                 color: parentAppColor),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          //   // child: ListTile(
          //   //   leading: Text('Hour'),
          //   //
          //   // ),
          // ),
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
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              child: Text('Hello'),
              // Search tab content goes here
            ),
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
  List<EventSlot> eventSlots = []; // List to store event slots
  String? selectedTime='12:00';
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
    setState(() {
      eventSlots.add(EventSlot(selectedTime!, '')); // Add a new slot with selected time
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> timeList = generateTimeOptions();
    List<Widget> slotRows = eventSlots.map((slot) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 5, left: 16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: adminAppColor),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: SizedBox.shrink(),
                    value: slot.selectedTime,
                    onChanged: (newValue) {
                      setState(() {
                        slot.selectedTime = newValue!;
                      });
                    },
                    items: timeList.map<DropdownMenuItem<String>>((String value) {
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
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 30,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      // Update event details when the text field changes
                      slot.eventDetails = newValue;
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }).toList();


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    color: adminAppColor, borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  gradeString,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ))),
            trailing: Container(
                width: 210,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Class A',
                      hintStyle: TextStyle(
                        color: adminAppColor,
                        decoration: TextDecoration.underline,
                      )
                      // label: Text(  ),
                      ),
                  textAlign: TextAlign.center,
                )),
          ),
          ListTile(
            title: Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    color: adminAppColor, borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  dateString,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ))),
            trailing: Container(
                width: 210,
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: adminAppColor),
                      hintText: '${DateFormat.MMMMEEEEd().format(DateTime.now())}'
                      // label: Text(  ),
                      ),
                  textAlign: TextAlign.center,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 12, left: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Time',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: adminAppColor),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      'Event',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: adminAppColor),
                    ),
                  ),
                )
              ],
            ),
            // child: ListTile(
            //   leading: Text('Hour'),
            //
            // ),
          ),
          ...slotRows,

          Container(

            child: TextButton(
              onPressed: (){
                addSlot();
              }, child: Row(
              children: [
                Icon(Icons.add,color: adminAppColor,),Text('Add',style: TextStyle(
                  color: adminAppColor,
                ),)
              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}
