import 'package:flutter/material.dart';

import 'admin_announcement_content.dart';
import 'admin_announcement_dynamic_popup_menu_button.dart';
class AdminAnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: AdminAnnouncementContent(),
    );
  }
}