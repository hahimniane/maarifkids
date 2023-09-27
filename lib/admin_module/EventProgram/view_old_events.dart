import 'package:flutter/material.dart';


import '../../utils/custom_view_old.dart';
import 'old_events_page.dart';
class ViewOldEvents extends StatelessWidget {
  const ViewOldEvents({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController gradeController=TextEditingController();
    TextEditingController dateController=TextEditingController();
    return  CustomViewOldPage(gradeController: gradeController, dateController: dateController, appBarTitleString: 'Event Program', nextPage: OldEventsPage(),);
  }
}
