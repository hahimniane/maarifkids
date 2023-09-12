import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../contants.dart';
class CustomActivityList extends StatefulWidget {
  final List<DateTime> dates;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  bool showSearchBar;

  CustomActivityList(
      {required this.dates,
        required this.selectedDate,
        required this.onDateSelected,
        required this.showSearchBar});

  @override
  _CustomActivityListState createState() => _CustomActivityListState();
}

class _CustomActivityListState extends State<CustomActivityList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              DateFormat.yMMMM().format(DateTime.now()),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            // color: Colors.blue,
            height: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex =
                          (currentIndex - 1).clamp(0, widget.dates.length - 1);
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.dates.length,
                    itemBuilder: (BuildContext context, int index) {
                      final date = widget.dates[index];
                      final isSelected = date == widget.selectedDate;
                      final dayOfMonth = DateFormat.d().format(date);
                      final dayOfWeek = DateFormat.E().format(date);

                      return GestureDetector(
                        onTap: () => widget.onDateSelected(date),
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
                                      color: isSelected
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                    ),
                                    child: Center(
                                      child: Text(
                                        dayOfMonth,
                                        style: TextStyle(
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
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      dayOfWeek,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                                  : Expanded(
                                child: Text(
                                  dayOfWeek,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              // : Expanded(
                              //     child: Container(
                              //       height: 25,
                              //       width: 40,
                              //       padding: EdgeInsets.all(3),
                              //       decoration: BoxDecoration(
                              //         color: isSelected
                              //             ? MainColor
                              //             : Colors.grey,
                              //         borderRadius:
                              //             BorderRadius.circular(5),
                              //       ),
                              //       child: Center(
                              //         child: Text(
                              //           dayOfWeek,
                              //           style: TextStyle(
                              //             color: isSelected
                              //                 ? Colors.white
                              //                 : MainColor,
                              //             fontWeight: FontWeight.bold,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex =
                          (currentIndex + 1).clamp(0, widget.dates.length - 1);
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Divider(
            thickness: 3,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}