import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../contants.dart';
import '../../parent_module/Bulletin/buletin_detailed_page.dart';
import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';
import '../../test_page.dart';

class AdminViewOldBulletinPage extends StatelessWidget {
  final bool isFromSearch;
  const AdminViewOldBulletinPage({super.key, required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: true,
        title: schoolBuletinString,
        context: context,
        isFromSearch: false,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 30, // Horizontal spacing between items
          mainAxisSpacing: 50, // Vertical spacing between items
        ),
        itemCount: 5, // Number of items
        itemBuilder: (BuildContext context, int index) {
          return _buildPamphlet(
              title: 'Maarif Bulletin  ${index + 1}',
              cover: 'images/bulettin/bultenweb${index + 1}.png',
              context: context);
        },
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

Widget _buildPamphlet(
    {required String title,
    required String cover,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BulletinDetailedPage(
                    title: 'Maarif bulletin',
                    coverImage: 'images/bulettin/bultenweb1.png',
                    topic: 'school',
                    randomText: lorem(paragraphs: 1, words: 20),
                    IsFromSearch: false,
                  )));
    },
    child: Card(
      elevation: 0,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Image.asset(cover),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: adminAppColor,
                          title: Text("Delete Bulletin"),
                          titleTextStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          content: Text(
                              "Are you sure you want to delete this Bulletin?"),
                          contentTextStyle: TextStyle(color: Colors.white),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    print('should delete');
                  },
                ),
              )
            ],
          )), // Use appropriate image asset or network image
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
