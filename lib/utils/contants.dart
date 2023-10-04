import 'package:flutter/material.dart';

const String profileSelectionString = 'Profile Selection';
const String announcementString = 'Announcements';
const String galleryString = 'Gallery';
const String progressTrackingString = 'Progress Tracking';
const String eventProgramString = 'Event Program';
const String foodListString = 'Food List';
const String healthString = 'Health';
const String attendanceString = 'Attendance';
const String schoolServiceString = 'School Service';

const String schoolBuletinString = 'School Bulletin';
const String dateString = 'Date';
const String gradeString = 'Grade';
Color parentAppColor = Color(0xff38C0C6);
Color adminAppColor = Color(0xffEF8515);
MaterialColor adminMaterialColor = MaterialColor(0xFFEF8515, <int, Color>{
  50: Color(0xFF558B2F),
  100: Color(0xFF558B2F),
  200: Color(0xFF558B2F),
  300: Color(0xFF558B2F),
  400: Color(0xFF558B2F),
  500: Color(0xFF558B2F),
  600: Color(0xFF558B2F),
  700: Color(0xFF558B2F),
  800: Color(0xFF558B2F),
  900: Color(0xFF558B2F),
});
MaterialColor parentMaterialColor = MaterialColor(0xff38C0C6, <int, Color>{
  50: Color(0xFF558B2F),
  100: Color(0xFF558B2F),
  200: Color(0xFF558B2F),
  300: Color(0xFF558B2F),
  400: Color(0xFF558B2F),
  500: Color(0xFF558B2F),
  600: Color(0xFF558B2F),
  700: Color(0xFF558B2F),
  800: Color(0xFF558B2F),
  900: Color(0xFF558B2F),
});
Color profileSecimiBackgroundColor = Color(0xffE7F7F8);
Color adminPageBackgroundColor = Color(0xfffce5c7);
Future animatedRoute(BuildContext context, page) {
  return Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => page(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              child: child,
            );
          }));
}

var appBar2 = AppBar(
  backgroundColor: parentAppColor,
  title: const Text(
    'Gallery',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
);

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;
  final bool isFromSearch;
  int count = 0;
  final bool isAdminColor;

  buildAppBar(
      {super.key,
      required this.title,
      required this.context,
      required this.isFromSearch,
      this.isAdminColor = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        color: Colors.white,
        onPressed: () {
          if (isFromSearch) {
            Navigator.of(context).popUntil((_) => count++ >= 2);
          } else {
            Navigator.pop(context);
          }
        },
      ),
      backgroundColor: isAdminColor ? adminAppColor : parentAppColor,
      title: Text(
        textAlign: TextAlign.center,
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// AppBar buildAppBar(String title, context,) {
//
//   return
// }
