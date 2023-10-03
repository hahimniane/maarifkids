import 'package:flutter/material.dart';
import 'package:maarifkids/admin_module/Progress%20Tracking/admin_progress_tracking_view_old.dart';

import '../../services/navigator_class.dart';
import '../../utils/contants.dart';
import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';
import '../../utils/search_functionality.dart';
import '../../utils/CustomIconButton.dart';

import 'admin_progress_tracking_add_new_file_page.dart';

class AdminProgressTrackingHomePage extends StatelessWidget {
  const AdminProgressTrackingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: progressTrackingString,
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
                NavigationHelper.pushPage(
                    context, AdminProgressAddNewFilePage());
              },
              iconData: Icons.add,
              label: 'Add New\n File',
            ),
            SizedBox(
              height: 20,
            ),
            CustomIconButton(
              onTap: () {
                NavigationHelper.pushPage(context, AdminProgressViewOldPage());
              },
              iconData: Icons.file_present_sharp,
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
