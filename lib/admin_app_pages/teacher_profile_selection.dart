import 'package:flutter/material.dart';

import 'constants.dart';
class TeacherProfileSelection extends StatelessWidget {
  const TeacherProfileSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: adminAppColor,
        title: Text('Profile Selection',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
      body: Column(
        children: [
          Card(

          )
        ],
      ),

    );
  }
}
