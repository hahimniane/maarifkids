import 'package:flutter/material.dart';
import 'package:maarifkids/admin_module/Food/admin_add_new_food_list.dart';
import 'package:maarifkids/admin_module/Food/admin_view_old_food_list.dart';


import '../../contants.dart';
import '../../utils/custom_nav_bar.dart';
import '../../parent_module/menu_page.dart';
import '../../test_page.dart';
import '../../utils/CustomIconButton.dart';
import '../../widgets/navigator_class.dart';
import '../Bulletin/admin_add_new_bulletin.dart';
import '../Bulletin/admin_view_old_buletin.dart';

class AdminFoodHomePage extends StatelessWidget {
  const AdminFoodHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: foodListString,
        context: context,
        isFromSearch: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(onTap: () {

              NavigationHelper.pushPage(context, AdminAddNewFoodListPage(isFromSearch: false,));
            }, iconData: Icons.add, label: 'Add New\n Food List',),

            SizedBox(
              height: 20,
            ),
            CustomIconButton(onTap: () {
              NavigationHelper.pushPage(context, AdminViewOldFoolListPage());
            }, iconData:  Icons.list_alt_sharp, label:  'View Food\n List',),

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
