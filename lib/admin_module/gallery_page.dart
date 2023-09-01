import 'package:flutter/material.dart';

import '../Pages/Components/custom_nav_bar.dart';
import '../Pages/menu_page.dart';
import '../contants.dart';
import '../test_page.dart';
import 'add_new_photo_page.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: 'Gallery',
        context: context,
        isFromSearch: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewPhotoPage()));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Card(
                      elevation: 4,
                      color: Color(0xffFDF5E7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: adminAppColor,
                            size: 80,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'Add New\n Photo',
                            style: TextStyle(
                              fontSize: 25,
                                color: adminAppColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {

              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Card(
                      elevation: 4,
                      color: Color(0xffFDF5E7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: adminAppColor,
                            size: 80,
                          ),
                          // Image(
                          //   height: 80,
                          //   image: AssetImage('images/admin_images/cameraIcon.png'),
                          //
                          // ),
                          Text(
                            textAlign: TextAlign.center,
                            'View Old',
                            style: TextStyle(
                                fontSize: 30,
                                color: adminAppColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
