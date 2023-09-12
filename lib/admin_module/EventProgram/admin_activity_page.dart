import 'package:flutter/material.dart';
import 'package:maarifkids/admin_module/utils/CustomIconButton.dart';

import '../../Pages/Components/Etkinlik_program_page.dart';
import '../../Pages/Components/custom_nav_bar.dart';
import '../../Pages/menu_page.dart';
import '../../contants.dart';
import '../../widgets/navigator_class.dart';
import 'admin_event_add_new_event_page.dart';
class AdminActivityPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: eventProgramString,
        context: context,
        isFromSearch: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(onTap: () {
              NavigationHelper.pushPage(context, AdminAddNewEventPage(isFromSearch: false,));

            }, iconData: Icons.add, label: 'Add New\n Event',),
            SizedBox(
              height: 20,
            ),
            CustomIconButton(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EtkinlikPage(
                            isFromSearch: false,
                          )));

            }, iconData: Icons.list_alt_outlined, label: 'View Old',)
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          } else {
            print('search screen');
          }
        },
      ),
    );
  }
}