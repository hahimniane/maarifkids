import 'package:flutter/material.dart';

import '../../../utils/contants.dart';
import '../../../parent_module/Health/health_infromation_page.dart';
import '../../../parent_module/Health/saglik_page.dart';
import '../../../menu_page.dart';
import '../../../utils/custom_nav_bar.dart';

class AdminHealthInformationResultsPage extends StatelessWidget {
  AdminHealthInformationResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: healthString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: Column(
        children: [
          const ProfileCard(
            isItFromHealthPage: true,
          ),
          Expanded(
            child: Container(
              height: 400,
              width: 350,
              child: Card(
                color: Color(0xffFEF1E2),
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HealthIussueCard(
                          title: 'Blood type',
                          issue: '0 rh (+)',
                        ),
                        HealthIussueCard(
                          title: 'Are there any health problems?',
                          issue: 'yok',
                        ),
                        HealthIussueCard(
                          title: 'Private Health insurance',
                          issue: 'Var (Axa Sigorta)',
                        ),
                        HealthIussueCard(
                          title: 'Does the kid have allergies?',
                          issue: 'yes',
                        ),
                        HealthIussueCard(
                          title: 'Doctor information',
                          issue: 'Hashim Niane',
                        ),
                        HealthIussueCard(
                          title: 'Emergency health information',
                          issue: '0880311414',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          }
        },
      ),
    );
  }
}
