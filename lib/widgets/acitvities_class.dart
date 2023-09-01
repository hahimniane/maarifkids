import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../Pages/Components/Etkinlik_program_page.dart';
import '../contants.dart';

class CustomActivityList extends StatefulWidget {
  final List<DateTime> dates;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final bool showSearchBar;
  final bool showDateOnTop;
  final bool addDividerAtTheBottom;

  CustomActivityList({
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
    required this.showSearchBar,
    this.showDateOnTop = true,
    this.addDividerAtTheBottom = true,
  });

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
        widget.showDateOnTop
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: parentAppColor,
                  ),
                  child: Text(
                    DateFormat.yMMMM().format(DateTime.now()),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Container(),
        Expanded(
          child: SizedBox(
            // color: Colors.blue,
            height: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      print('back arrow');
                      currentIndex =
                          (currentIndex - 1).clamp(0, widget.dates.length - 1);
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: parentAppColor,
                ),
                customHorizontalDatePicker(
                    dates: widget.dates,
                    selectedDate: widget.selectedDate,
                    onDateSelected: widget.onDateSelected),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex =
                          (currentIndex + 1).clamp(0, widget.dates.length - 1);
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                  color: parentAppColor,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: widget.addDividerAtTheBottom
              ? Divider(
                  thickness: 3,
                  color: parentAppColor,
                )
              : Container(),
        ),
      ],
    );
  }
}
