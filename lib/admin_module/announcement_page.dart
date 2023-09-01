import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:maarifkids/Pages/Components/announcement_details_page.dart';
import 'package:maarifkids/contants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../Pages/Components/custom_nav_bar.dart';
import '../Pages/Components/pdf_viewer_page.dart';
import '../Pages/menu_page.dart';
import '../test_page.dart';

class AdminAnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: _AdminAnnouncementContent(),
    );
  }
}

class _AdminAnnouncementContent extends StatefulWidget {
  @override
  __AdminAnnouncementContentState createState() =>
      __AdminAnnouncementContentState();
}

class __AdminAnnouncementContentState extends State<_AdminAnnouncementContent> {
  int _previousTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        tabBarTheme: TabBarTheme(
          labelColor: adminAppColor,
        ),
      ),
      child: Scaffold(
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
                  PostedAnnouncements(announcementsList: announcements),
                  DeletedAnnouncements(
                    deletedAnnouncement: announcements,
                  ),
                  WithDrawnAnnouncements(
                    withDrawnAnnouncements: announcements,
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
      ),
    );
  }
}




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

class CreateNewAnnouncement extends StatefulWidget {
  CreateNewAnnouncement({
    super.key,
  });

  @override
  State<CreateNewAnnouncement> createState() => _CreateNewAnnouncementState();
}

class _CreateNewAnnouncementState extends State<CreateNewAnnouncement> {
  List<File> selectedFiles = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: adminAppColor,
                    )),
                child: TextButton(
                    onPressed: () {
                      //TODO: make sure that the user is not empty.
                      //TODO: make sure that the subject is not empty
                      //TODO: make sure that the message is not empty
                      //TODO: check if there is any attachement attached.
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 10,
                              color: adminAppColor,
                            ),
                          ],
                        ),
                        Text(
                          'Send',
                          style: TextStyle(color: adminAppColor, fontSize: 10),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              color: adminAppColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            'To',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ))),
                      Container(width: 210, child: TextField(
                        textAlign: TextAlign.center,
                      ),),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              color: adminAppColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            'Subject',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ))),
                      Container(width: 210, child: TextField(  textAlign: TextAlign.center,))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFDF1E2),
                      borderRadius: BorderRadius.circular(9)),
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: TextField(

                    expands: true,
                    decoration: InputDecoration(

                      labelText: 'Enter Message',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.multiline,
                    // textInputAction: TextInputAction.,
                    minLines: null, // <-- SEE HERE
                    maxLines: null, // <-- SEE HERE
                  ))),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            style: TextButton.styleFrom(),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                // allowedExtensions: ['pdf'],
              );

              if (result != null) {
                selectedFiles =
                    result.paths.map((path) => File(path!)).toList();
                setState(() {}); // Update the UI to reflect the selected files
              } else {
                print('user cancelled the picker');
                // User canceled the picker
              }
            },
            child: Row(
              children: [
                Image(
                  height: 30,
                  width: 30,
                  image:
                      AssetImage('images/admin_images/attachedFilesIcon.png'),
                ),
                Text(
                  'Attached Files',
                  style: TextStyle(
                      color: adminAppColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: selectedFiles.isNotEmpty
                ? Row(
                    children: selectedFiles.map((file) {
                      return GestureDetector(
                        onTap: () {
                          print('clicked');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SyncVisionPdfViewer(
                                pdfSource: file,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            'images/admin_images/pdfIcon.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : Container()
            // Padding(
            //   padding: const EdgeInsets.only(left: 13.0),
            //   child: Image(
            //     height: 30,
            //     width: 30,
            //     image: AssetImage('images/admin_images/pdfIcon.png'),
            //   ),
            // ),
            )
      ],
    );
  }
}

class Announcement {
  final String title;
  final String content;

  Announcement({required this.title, required this.content});
}

List<Announcement> announcements = [
  Announcement(
    title: 'Parent Meeting',
    content: 'This is the content of Announcement 1.',
  ),
  Announcement(
      title: "Trip Plan",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  Announcement(
      title: "Gezi Plani",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  Announcement(
      title: "Trip Plan",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  Announcement(
      title: "Trip Plan",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  Announcement(
      title: "Trip Plan",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  Announcement(
      title: "Trip Plan",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  Announcement(
      title: "Trip Plan",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  Announcement(
      title: "Trip Plan",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  Announcement(
      title: "Trip Plan",
      content:
          'Değerli Velilerimiz, 25 Haziran Pazar günü veli toplantısı düzenlenecektir. Katılımlarınızı önemle rica ederiz.'),
  // Add more announcements as needed
];

class DynamicAnnouncementCard extends StatelessWidget {
  final dynamicPopUpMenuButtonListItems;
  final Announcement announcement;

  DynamicAnnouncementCard({required this.announcement,required this.dynamicPopUpMenuButtonListItems});

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
          dynamicPopUpMenuButton(announncementsListItems: dynamicPopUpMenuButtonListItems,),
        ],

        // subtitle:
        // trailing:
      ),
    );
  }
}

class dynamicPopUpMenuButton extends StatelessWidget {
  final announncementsListItems;
  const dynamicPopUpMenuButton({
    super.key, required this.announncementsListItems,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: adminAppColor,
      icon: Icon(
        Icons.more_vert_rounded,
        color: adminAppColor,
      ),
      onSelected: (value) {
        // Handle popup menu item selection
        // You can perform different actions based on the selected value
      },
      itemBuilder: (context) => announncementsListItems

    );
  }
}


 List<PopupMenuEntry<String>>  postedAnnouncementsListItems=  [
   PopupMenuItem<String>(
     value: 'Delete',
     child: Container(
       width: 50,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(4),
         color: Colors.white,
       ),
       child: Center(
         child: Text(
           'Delete',
           style: TextStyle(color: adminAppColor),
         ),
       ),
     ),
   ),
   PopupMenuItem<String>(
     value: 'Withdraw',
     child: Container(
// width: 80,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(4),
         color: Colors.white,
       ),
       child: Center(
         child: Text(
           'Withdraw',
           style: TextStyle(color: adminAppColor),
         ),
       ),
     ),
   ),
// Add more menu items as needed
 ];

List<PopupMenuEntry<String>>  deletedAnnouncementsListItems=  [
  PopupMenuItem<String>(
    value: 'Remove',
    child: Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'Remove',
          style: TextStyle(color: adminAppColor),
        ),
      ),
    ),
  ),
  PopupMenuItem<String>(
    value: 'Edit',
    child: Container(
// width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'Edit',
          style: TextStyle(color: adminAppColor),
        ),
      ),
    ),
  ),
// Add more menu items as needed
];
List<PopupMenuEntry<String>>  withDrawnAnnouncementsListItems=  [
  PopupMenuItem<String>(
    value: 'Remove',
    child: Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'Remove',
          style: TextStyle(color: adminAppColor),
        ),
      ),
    ),
  ),
  PopupMenuItem<String>(
    value: 'Edit',
    child: Container(
// width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'Edit',
          style: TextStyle(color: adminAppColor),
        ),
      ),
    ),
  ),
// Add more menu items as needed
];