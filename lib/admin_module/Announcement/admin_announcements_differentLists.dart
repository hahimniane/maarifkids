import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import 'admin_announcement_model.dart';

List<PopupMenuEntry<String>> postedAnnouncementsListItems = [
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

List<PopupMenuEntry<String>> deletedAnnouncementsListItems = [
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
List<PopupMenuEntry<String>> withDrawnAnnouncementsListItems = [
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

List<Announcement> announcementsList = [
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
