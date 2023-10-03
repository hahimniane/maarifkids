import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:maarifkids/utils/contants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../utils/search_functionality.dart';
import 'admin_announcement_model.dart';

class dynamicPopUpMenuButton extends StatelessWidget {
  final announncementsListItems;
  const dynamicPopUpMenuButton({
    super.key,
    required this.announncementsListItems,
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
        itemBuilder: (context) => announncementsListItems);
  }
}
