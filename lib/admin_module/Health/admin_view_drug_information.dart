import 'package:flutter/material.dart';

import '../../utils/custom_view_old.dart';
import '../Gallery/admin_gallery_fetched_albums_page.dart';

class AdminDrugInformationHomePage extends StatelessWidget {
   AdminDrugInformationHomePage({super.key});
  final TextEditingController galleryGradeController=TextEditingController();
  final TextEditingController galleryDateController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  CustomViewOldPage(gradeController: galleryGradeController, dateController: galleryDateController, appBarTitleString: 'Gallery', nextPage: FetchedAlbumsPage(),isItHealthPage: true,);
  }
}
