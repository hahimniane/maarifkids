import 'package:flutter/material.dart';

import 'admin_event_add_new_event_page.dart';
class OldEventsPage extends StatelessWidget {
  const OldEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminAddNewEventPage(isFromSearch: false,);
  }
}
