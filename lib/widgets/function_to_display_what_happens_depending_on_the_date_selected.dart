import 'package:flutter/material.dart';


import '../Parents_app_pages/Components/Etkinlik_program_page.dart';
import '../contants.dart';

Widget getActivitiesForDate(
    DateTime date, String responseIfWeekend, Widget responseIfWeekDay) {
  if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
    return Center(child: Text(responseIfWeekend));
  } else {
    return responseIfWeekDay;
  }
}

class listViewForDisplayingListOfActivities extends StatelessWidget {
  const listViewForDisplayingListOfActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hours.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 12, left: 16),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  hours[index],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MainColor),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black54,
                        width: 1.6,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      listOfActivities[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: MainColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // child: ListTile(
          //   leading: Text('Hour'),
          //
          // ),
        );
      },
    );
  }
}
