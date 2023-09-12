import 'package:flutter/material.dart';

import 'admin_announcement_card.dart';
import 'admin_announcement_dynamic_popup_menu_button.dart';
import 'admin_announcement_model.dart';
import 'admin_announcements_differentLists.dart';
class DeletedAnnouncements extends StatelessWidget {
  final List<Announcement> deletedAnnouncement;
  const DeletedAnnouncements({
    super.key,
    required this.deletedAnnouncement,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: deletedAnnouncement.length,
        itemBuilder: (BuildContext context, int index) {
          {
            return DynamicAnnouncementCard(
              announcement: deletedAnnouncement[index], dynamicPopUpMenuButtonListItems: deletedAnnouncementsListItems,
            );
          }
        });
  }
}