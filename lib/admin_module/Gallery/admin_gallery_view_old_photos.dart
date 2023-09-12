import 'package:flutter/material.dart';

import '../../Pages/Components/custom_nav_bar.dart';
import '../../Pages/menu_page.dart';
import '../../contants.dart';
import '../../test_page.dart';
import 'admin_gallery_fetched_albums_page.dart';
class ViewOldPhotos extends StatelessWidget {
  const ViewOldPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: buildAppBar(
          title: 'Gallery',
          context: context,
          isFromSearch: false,
          isAdminColor: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: adminAppColor,
                        )),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchedAlbumsPage()));
                          //TODO: make sure that the user is not empty.
                          //TODO: make sure that the subject is not empty
                          //TODO: make sure that the message is not empty
                          //TODO: check if there is any attachement attached.
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  size: 20,
                                  color: adminAppColor,
                                ),
                              ],
                            ),
                            Text(
                              'View',
                              style: TextStyle(color: adminAppColor, fontSize: 10,fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: adminAppColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                    'Grade',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ))),
                          Container(width: 210, child: TextField(
                            textAlign: TextAlign.center,
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: adminAppColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                    'Date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ))),
                          Container(width: 210, child: TextField(  textAlign: TextAlign.center,))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
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
