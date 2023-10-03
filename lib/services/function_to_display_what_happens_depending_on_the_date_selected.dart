import 'package:flutter/material.dart';

import '../utils/contants.dart';
import '../utils/lists.dart';

Widget getActivitiesForDate(
    {required DateTime date,
    required String responseIfWeekend,
    required Widget responseIfWeekDay}) {
  if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
    return Center(child: Text(responseIfWeekend));
  } else {
    return responseIfWeekDay;
  }
}

class listViewForDisplayingListOfActivities extends StatelessWidget {
  final List itemAccount;
  const listViewForDisplayingListOfActivities({
    super.key,
    required this.itemAccount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemAccount.length,
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
                    color: Theme.of(context).primaryColor,
                  ),
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
                        color: Theme.of(context).primaryColor,
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
