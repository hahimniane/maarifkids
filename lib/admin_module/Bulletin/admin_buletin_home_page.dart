import 'package:flutter/material.dart';

import '../../services/navigator_class.dart';
import '../../utils/contants.dart';
import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';
import '../../utils/search_functionality.dart';
import '../../utils/CustomIconButton.dart';

import 'admin_add_new_bulletin.dart';
import 'admin_view_old_buletin.dart';

class AdminSchoolBulletinHomePage extends StatelessWidget {
  const AdminSchoolBulletinHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: schoolBuletinString,
        context: context,
        isFromSearch: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(
              onTap: () {
                NavigationHelper.pushPage(context, AdminAddNewBulletinPage());
              },
              iconData: Icons.add,
              label: 'Add New\n Publication',
            ),
            SizedBox(
              height: 20,
            ),
            CustomIconButton(
              onTap: () {
                NavigationHelper.pushPage(
                    context,
                    AdminViewOldBulletinPage(
                      isFromSearch: false,
                    ));
              },
              iconData: Icons.list_alt_sharp,
              label: 'View Old',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          } else if (value == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchFieldSample()));
          }
        },
      ),
    );
  }
}
