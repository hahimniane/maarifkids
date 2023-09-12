import 'package:flutter/material.dart';
import 'package:maarifkids/admin_module/utils/CustomIconButton.dart';
import 'package:maarifkids/admin_module/Gallery/admin_gallery_view_old_photos.dart';
import 'package:maarifkids/widgets/navigator_class.dart';

import '../../Pages/Components/custom_nav_bar.dart';
import '../../Pages/menu_page.dart';
import '../../contants.dart';
import '../../test_page.dart';
import 'admin_gallery_add_new_photo_page.dart';


class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: galleryString,
        context: context,
        isFromSearch: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(onTap: () {

              NavigationHelper.pushPage(context, AddNewPhotoPage());
            }, iconData: Icons.add, label: 'Add New\n Photo',),

            SizedBox(
              height: 20,
            ),
            CustomIconButton(onTap: () {
              NavigationHelper.pushPage(context, ViewOldPhotos());
            }, iconData:  Icons.camera_alt, label:  'View Old',),

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


