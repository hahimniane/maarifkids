import 'package:flutter/material.dart';

import 'admin_announcement_card.dart';
import 'admin_announcement_dynamic_popup_menu_button.dart';
import 'admin_announcement_model.dart';
import 'admin_announcements_differentLists.dart';
class WithDrawnAnnouncements extends StatelessWidget {
  final List<Announcement> withDrawnAnnouncements;
  const WithDrawnAnnouncements({
    super.key,
    required this.withDrawnAnnouncements,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: withDrawnAnnouncements.length,
        itemBuilder: (BuildContext context, int index) {
          {
            return DynamicAnnouncementCard(
              announcement: withDrawnAnnouncements[index], dynamicPopUpMenuButtonListItems: withDrawnAnnouncementsListItems,
            );
          }
        });
  }
}