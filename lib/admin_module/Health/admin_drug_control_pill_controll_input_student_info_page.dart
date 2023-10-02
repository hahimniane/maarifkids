import 'package:flutter/material.dart';

import '../../contants.dart';
import '../../utils/custom_view_old.dart';
import 'admin_health_add _new_pill_page.dart';
import 'admin_health_drug_control_student_input_information_result_page.dart';

class AdminPillControlInputStudentInfoPage extends StatelessWidget {
  AdminPillControlInputStudentInfoPage({super.key});

  final TextEditingController galleryGradeController = TextEditingController();
  final TextEditingController galleryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomViewOldPage(
      shouldAddStudentWithMedicationControl: true,
      gradeController: galleryGradeController,
      dateController: galleryDateController,
      appBarTitleString: healthString,
      nextPage: AdminHealthDrugControlStudentMedicationResultPage(
        isFromSearch: false,
        onDateSelected: (DateTime) {},
      ),
      isItHealthPage: true,
    );
  }
}
