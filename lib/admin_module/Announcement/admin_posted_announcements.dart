import 'package:flutter/material.dart';

import 'admin_announcement_card.dart';
import 'admin_announcement_dynamic_popup_menu_button.dart';
import 'admin_announcement_model.dart';
import 'admin_announcements_differentLists.dart';
class PostedAnnouncements extends StatelessWidget {
  final List<Announcement> announcementsList;

  PostedAnnouncements({required this.announcementsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: 10,
      itemCount: announcementsList.length,
      itemBuilder: (context, index) {
        return DynamicAnnouncementCard(announcement: announcementsList[index], dynamicPopUpMenuButtonListItems: postedAnnouncementsListItems,);
      },
    );
  }
}