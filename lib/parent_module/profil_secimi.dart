import 'package:flutter/material.dart';
import '../utils/contants.dart';
import '../utils/profile_selection_student_card.dart';

class ParentProfileSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: buildAppBar(
        title: profileSelectionString,
        context: context,
        isFromSearch: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            profileSelectionStudentCard(
              studentName: 'Yavuz Selim',
              imageUrl: 'images/yavuz_selim.jpeg',
              studentNumber: '12345',
            ),
            profileSelectionStudentCard(
              studentName: 'Abdullah Niane',
              imageUrl: 'images/IMG_2103.png',
              studentNumber: '67890',
            ),
          ],
        ),
      ),
    );
  }
}
