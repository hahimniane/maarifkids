import 'package:flutter/material.dart';
import 'package:maarifkids/admin_module/utils/custom_view_old.dart';

import '../../Pages/Components/custom_nav_bar.dart';
import '../../Pages/menu_page.dart';
import '../../contants.dart';
import '../../test_page.dart';
import 'admin_gallery_fetched_albums_page.dart';
class ViewOldPhotos extends StatelessWidget {
   ViewOldPhotos({super.key});
  TextEditingController galleryGradeController=TextEditingController();
  TextEditingController galleryDateController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
    CustomViewOldPage(gradeController: galleryGradeController, dateController: galleryDateController, appBarTitleString: 'Gallery', nextPage: FetchedAlbumsPage(),);

  }
}
