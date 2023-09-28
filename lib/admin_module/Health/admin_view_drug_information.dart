import 'package:flutter/material.dart';

import '../../contants.dart';
import '../../parent_module/menu_page.dart';
import '../../test_page.dart';
import '../../utils/CustomIconButton.dart';
import '../../utils/custom_nav_bar.dart';
import '../../utils/custom_view_old.dart';
import '../../widgets/navigator_class.dart';
import '../Gallery/admin_gallery_fetched_albums_page.dart';
import '../Progress Tracking/admin_progress_tracking_add_new_file_page.dart';
import '../Progress Tracking/admin_progress_tracking_view_old.dart';

class AdminDrugInformationHomePage extends StatelessWidget {
   AdminDrugInformationHomePage({super.key});
  final TextEditingController galleryGradeController=TextEditingController();
  final TextEditingController galleryDateController=TextEditingController();

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
            CustomIconButton(onTap: () {

              NavigationHelper.pushPage(context, AdminProgressAddNewFilePage());
            }, iconData: Icons.add, label: 'Add New\n Pill',),

            SizedBox(
              height: 20,
            ),
            CustomIconButton(onTap: () {


              NavigationHelper.pushPage(context, AdminProgressViewOldPage());
            }, iconData:  Icons.list_alt_outlined, label:  'Pill Control',),

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
