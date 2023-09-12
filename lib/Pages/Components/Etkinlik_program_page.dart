import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../admin_module/utils/lists.dart';
import '../../contants.dart';
import '../../test_page.dart';
import '../../widgets/acitvities_class.dart';
import '../../widgets/function_for_initializing_dates.dart';
import '../../widgets/function_to_display_what_happens_depending_on_the_date_selected.dart';
import '../menu_page.dart';
import 'custom_nav_bar.dart';


List<String> deneme = [
  'Book',
  'Pen',
  'diallo',
];

class EtkinlikPage extends StatefulWidget {
  final bool isFromSearch;
  const EtkinlikPage({super.key, required this.isFromSearch});

  @override
  _EtkinlikPageState createState() => _EtkinlikPageState();
}

class _EtkinlikPageState extends State<EtkinlikPage> {
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
        whatToReturnAsAWidget: listViewForDisplayingListOfActivities(itemAccount: hours,));
    // this.selectedDate = selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: 'Activity Page',
        context: context,
        isFromSearch: widget.isFromSearch,
      ),
      // buildAppBar('Etkinlik Sayfasi', context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(4),
          //       color: MainColor,
          //     ),
          //     child: Text(
          //       yearAndMonth,
          //       style:
          //           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
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

          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 12, left: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Hour',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: parentAppColor),
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
                          color: parentAppColor),
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

class customHorizontalDatePicker extends StatelessWidget {
  const customHorizontalDatePicker({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  });

  // final CustomActivityList widget;
  // final CustomActivityList widget;
  // final CustomActivityList widget;
  // final CustomActivityList widget;
  final List<DateTime> dates;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  // bool showSearchBar;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (BuildContext context, int index) {
          final date = dates[index];
          final isSelected = date == selectedDate;
          final dayOfMonth = DateFormat.d().format(date);
          final dayOfWeek = DateFormat.E().format(date);

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            dayOfMonth,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  isSelected
                      ? Expanded(
                          flex: 0,
                          child: Container(
                            width: 40,
                            height: 20,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                dayOfWeek,
                                style: TextStyle(

                                  color: isSelected
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Text(
                            dayOfWeek,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )

                  //   ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class CustomActivityList extends StatelessWidget {
//   final List<DateTime> dates;
//   final DateTime selectedDate;
//   final Function(DateTime) onDateSelected;
//
//   var scrollController = ScrollController();
//
//   CustomActivityList({
//     required this.dates,
//     required this.selectedDate,
//     required this.onDateSelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: MainColor,
//             ),
//             child: Text(
//               DateFormat.yMMMM().format(DateTime.now()),
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: SizedBox(
//             // color: Colors.blue,
//             height: 0,
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     // Handle moving to previous dates
//                   },
//                   icon: Icon(Icons.arrow_back_ios),
//                   color: MainColor,
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     controller: scrollController,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: dates.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final date = dates[index];
//                       final isSelected = date == selectedDate;
//                       final dayOfMonth = DateFormat.d().format(date);
//                       final dayOfWeek = DateFormat.E().format(date);
//
//                       return GestureDetector(
//                         onTap: () => onDateSelected(date),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: Container(
//                                     width: 50,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color:
//                                           isSelected ? MainColor : Colors.grey,
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         dayOfMonth,
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               isSelected
//                                   ? Expanded(
//                                       child: Container(
//                                         padding: EdgeInsets.all(3),
//                                         decoration: BoxDecoration(
//                                           color: isSelected
//                                               ? MainColor
//                                               : Colors.grey,
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                         ),
//                                         child: Text(
//                                           dayOfWeek,
//                                           style: TextStyle(
//                                             color: isSelected
//                                                 ? Colors.white
//                                                 : MainColor,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   : Expanded(
//                                       child: Text(
//                                         dayOfWeek,
//                                         style: TextStyle(
//                                           color: MainColor,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.arrow_forward_ios),
//                   color: MainColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Divider(
//             thickness: 3,
//             color: MainColor,
//           ),
//         ),
//       ],
//     );
//   }
// }
