import 'package:flutter/material.dart';



import '../../utils/custom_view_old.dart';
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
