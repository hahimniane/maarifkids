import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import 'admin_announcement_dynamic_popup_menu_button.dart';
import 'admin_announcement_model.dart';

class DynamicAnnouncementCard extends StatelessWidget {
  final dynamicPopUpMenuButtonListItems;
  final Announcement announcement;

  DynamicAnnouncementCard(
      {required this.announcement,
      required this.dynamicPopUpMenuButtonListItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(
            'images/admin_images/annoucementIcon.png',
            // color: adminAppColor,
            height: 20,
            width: 30,
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      announcement.title,
                      style: TextStyle(
                          color: adminAppColor, fontWeight: FontWeight.bold),
                    ),
                    Text(announcement.content),
                  ],
                ),
              )),
          dynamicPopUpMenuButton(
            announncementsListItems: dynamicPopUpMenuButtonListItems,
          ),
        ],

        // subtitle:
        // trailing:
      ),
    );
  }
}
