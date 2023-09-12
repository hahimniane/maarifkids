import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../admin_module/utils/custom_horizontal_activity_dates.dart';
import '../../contants.dart';
import '../../test_page.dart';
import '../menu_page.dart';
import 'Etkinlik_program_page.dart';
import 'custom_nav_bar.dart';

class FoodPage extends StatefulWidget {
  final bool isFromSearch;
  FoodPage({
    super.key,
    required this.isFromSearch,
  });
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
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
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SearchFieldSample()));
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
    initializeDates();
  }

  void initializeDates() {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    for (int i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
      final date = DateTime(now.year, now.month, i);
      dates.add(date);
      activities.add(getActivitiesForDate(date));
    }

    selectedDate = dates.first;
  }

  final yearAndMonth = DateFormat.yMMMM().format(DateTime.now());
  Widget getActivitiesForDate(DateTime date) {
    if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
      return Container(
        // color: Colors.blue,
        child: Center(
            child: Text(
          'There is no School',
          style: TextStyle(
            color: parentAppColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      );
    } else {
      return MyColumn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: profileSecimiBackgroundColor,
      appBar: buildAppBar(
        title: 'Food Page',
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
              selectedDate: selectedDate!,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              showSearchBar: showSearchBar,
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
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
                // child: Text('Hello'),
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

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Breakfast Card
          Card(
            color: parentAppColor,
            // width: double.infinity,
            // color: MainColor,
            // padding: EdgeInsets.all(16.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Breakfast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Box with Meal Lines
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: parentAppColor,
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  MealLine(text: 'Eggs'),
                  MealLine(text: 'corn'),
                  MealLine(text: 'apple'),
                  MealLine(text: 'honey'),
                  MealLine(text: 'Sut'),
                ],
              ),
            ),
          ),

          // Lunch Card
          Card(
            color: parentAppColor,
            // width: double.infinity,
            // color: MainColor,
            // padding: EdgeInsets.all(16.0),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Lunch',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Box with Meal Lines
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: parentAppColor,
                  width: 2.0,
                ),
              ),
              child: const Column(
                children: [
                  MealLine(text: 'Yogurt'),
                  MealLine(text: 'Banana'),
                  MealLine(text: 'Rice'),
                  MealLine(text: 'Fries'),
                  MealLine(text: 'Kebab'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MealLine extends StatelessWidget {
  final String text;

  const MealLine({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.grey,
          border: Border(
            bottom: BorderSide(
              color: parentAppColor,
              width: 1.0,
            ),
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: parentAppColor,
            fontWeight: FontWeight.w700,
          ),
        )),
        // width: 4.0,
        // height: 20.0,
      ),
    );
  }
}
