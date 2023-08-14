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
  title: const Text(
    'Gallery',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
);

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;
  final bool isFromSearch;

  final List <Widget> actions;
  int count = 0;

  buildAppBar(
      {super.key,
      required this.title,
      required this.context,
      required this.isFromSearch,

      this.actions=const []});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: Colors.white,
        onPressed: () {
          if (isFromSearch) {
            Navigator.of(context).popUntil((_) => count++ >= 2);
          } else {
            Navigator.pop(context);
          }
        },
      ),
      backgroundColor: MainColor,
      title: Text(
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
