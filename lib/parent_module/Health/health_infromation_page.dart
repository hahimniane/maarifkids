import 'package:flutter/material.dart';

import 'package:maarifkids/utils/contants.dart';
import 'package:maarifkids/parent_module/Health/saglik_page.dart';

import '../../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';

class HealthInformationPage extends StatelessWidget {
  final bool isFromSearch;
  const HealthInformationPage({super.key, required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Health',
        context: context,
        isFromSearch: isFromSearch,
      ),
      body: Column(
        children: [
          const ProfileCard(),
          Divider(
            color: parentAppColor,
          ),
          Expanded(
            child: Card(
              color: profileSecimiBackgroundColor,
              child: const Padding(
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

class HealthIussueCard extends StatelessWidget {
  final String title;
  final String issue;
  const HealthIussueCard({
    super.key,
    required this.title,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
          // width: 100,
          height: 50,
          child: Card(
              color: Colors.white,
              child: Center(
                  child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Text(
                    issue,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ))
                ],
              )))),
    );
  }
}
