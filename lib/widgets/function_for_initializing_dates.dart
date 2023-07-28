import 'package:flutter/cupertino.dart';

import 'function_to_display_what_happens_depending_on_the_date_selected.dart';

DateTime? initializeDates(
    {required List dates,
    required List<Widget> activities,
    required Widget whatToReturnAsAWidget,
    DateTime? selectedDate}) {
  final now = DateTime.now();
  final firstDayOfMonth = DateTime(now.year, now.month, 1);
  final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

  for (int i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
    final date = DateTime(now.year, now.month, i);
    dates.add(date);
    activities.add(getActivitiesForDate(
        date, 'there is no activity', whatToReturnAsAWidget));
  }

  selectedDate = dates.first;
  return selectedDate;
}
