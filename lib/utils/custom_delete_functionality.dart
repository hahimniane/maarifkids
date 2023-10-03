import 'package:flutter/material.dart';

import 'contants.dart';

class CustomDeleteWidget extends StatelessWidget {
  final String title;
  final String content;
  const CustomDeleteWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: adminAppColor,
      title: Text(title),
      titleTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      content: Text(content),
      contentTextStyle: TextStyle(color: Colors.white),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Delete",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
