import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../../utils/custom_view_old.dart';
import 'admin_health_add _new_pill_page.dart';

class AdminViewStudentHealthInformationPage extends StatelessWidget {
  AdminViewStudentHealthInformationPage({super.key});

  final TextEditingController galleryGradeController = TextEditingController();
  final TextEditingController galleryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomViewOldPage(
      gradeController: galleryGradeController,
      dateController: galleryDateController,
      appBarTitleString: healthString,
      nextPage: AdminHealthAddNewPillPage(
        isFromSearch: false,
      ),
      isItHealthPage: true,
    );
  }
}
