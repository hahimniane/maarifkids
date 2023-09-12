import 'package:flutter/material.dart';

import '../../Pages/Components/custom_nav_bar.dart';
import '../../Pages/menu_page.dart';
import '../../contants.dart';
import '../../test_page.dart';
import 'admin_announcement_dynamic_popup_menu_button.dart';
import 'admin_announcements_differentLists.dart';
import 'admin_create_new_announcement.dart';
import 'admin_deleted_announcements.dart';
import 'admin_posted_announcements.dart';
import 'admin_withdrawn_announcements.dart';
class AdminAnnouncementContent extends StatefulWidget {
  @override
  _AdminAnnouncementContentState createState() =>
      _AdminAnnouncementContentState();
}

class _AdminAnnouncementContentState extends State<AdminAnnouncementContent> {
  int _previousTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: adminAppColor,
        title: Text(
          'Announcements',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            onTap: (item) {
              print('the system previous item is $_previousTabIndex');
              // Update the previous tab index
              setState(() {
                _previousTabIndex = DefaultTabController.of(context).index;
              });

              if ( _previousTabIndex == 0) {
                // print('Please save the information before you leave');
              }
            },
            indicatorColor: adminAppColor,
            tabs: [
              Tab(
                text: 'New Announcement',
                icon: Icon(Icons.file_open_outlined),
              ),
              Tab(text: 'Posted'),
              Tab(text: 'Deleted'),
              Tab(text: 'Withdrawals'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                CreateNewAnnouncement(),
                PostedAnnouncements(announcementsList: announcementsList),
                DeletedAnnouncements(
                  deletedAnnouncement: announcementsList,
                ),
                WithDrawnAnnouncements(
                  withDrawnAnnouncements: announcementsList,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          } else if (value == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchFieldSample()));
          }
        },
      ),
    );
  }
}