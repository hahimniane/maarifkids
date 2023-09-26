import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maarifkids/admin_module/Food/admin_add_new_food_list.dart';
import 'package:maarifkids/admin_module/Food/admin_view_old_food_list.dart';

import '../../Pages/Components/custom_nav_bar.dart';
import '../../Pages/Components/health_infromation_page.dart';
import '../../Pages/menu_page.dart';
import '../../contants.dart';
import '../../test_page.dart';
import '../../widgets/navigator_class.dart';
import '../Bulletin/admin_add_new_bulletin.dart';
import '../Bulletin/admin_view_old_buletin.dart';
import '../utils/CustomIconButton.dart';
class AdminHealthHomePage extends StatelessWidget {
  const AdminHealthHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xfffce5c7),
      appBar: buildAppBar(
        isAdminColor: true,
        title: healthString,
        context: context,
        isFromSearch: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton( text: 'Health Information', cardColor: adminAppColor, destinationPage: ,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            CustomButton( text: 'Drug Information', cardColor: Colors.white, destinationPage: null,),



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

class CustomButton extends StatelessWidget {
  final String text;
 final Widget destinationPage;
 final  Color cardColor;
  const CustomButton({
    super.key,  required this.text, required this.cardColor, required this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Center(
          child: SizedBox(
              height: 100,
              width: 270,
              child: InkWell(
                onTap: () {
                  NavigationHelper.pushPage(
                      context,
                      destinationPage);
                },
                child: Card(
                  color: cardColor,
                  child:  Center(
                      child: Text(
                        text,
                        style: TextStyle(
                            color:cardColor==Colors.white? Theme.of(context).primaryColor:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),
                ),
              ))),
    );
  }
}
