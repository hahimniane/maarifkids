import 'package:flutter/material.dart';

Color MainColor = Color(0xff38C0C6);
Color profileSecimiBackgroundColor = Color(0xffE7F7F8);
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
  backgroundColor: MainColor,
  title: Text(
    'Gallery',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
);
AppBar buildAppBar(String title, context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new),
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: MainColor,
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}
