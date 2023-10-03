import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../utils/contants.dart';
import '../../utils/search_functionality.dart';
import '../../menu_page.dart';
import 'buletin_detailed_page.dart';
import '../../utils/custom_nav_bar.dart';

class SchoolBulettinPage extends StatelessWidget {
  final bool isFromSearch;
  const SchoolBulettinPage({super.key, required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'School Bulletin',
        context: context,
        isFromSearch: isFromSearch,
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
              child: Image.asset(
                  cover)), // Use appropriate image asset or network image
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(
                  fontSize: 16,
                  color: parentAppColor,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
