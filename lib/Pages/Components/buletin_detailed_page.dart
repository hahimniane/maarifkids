import 'package:flutter/material.dart';
import 'package:maarifkids/Pages/Components/announcement_details_page.dart';
import 'package:maarifkids/Pages/Components/pdf_viewer_page.dart';
import 'package:maarifkids/test_page.dart';

import '../../admin_module/utils/custom_date_picker.dart';
import '../../contants.dart';

import 'package:flutter/material.dart';

import '../menu_page.dart';
import 'custom_nav_bar.dart';

class BulletinDetailedPage extends StatelessWidget {
  final String title;
  final String coverImage;
  final String topic;
  final String randomText;

  final bool IsFromSearch;

  BulletinDetailedPage({
    required this.title,
    required this.coverImage,
    required this.topic,
    required this.randomText,
    required this.IsFromSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        isAdminColor: Theme.of(context).primaryColor==adminAppColor?true:false,
        title: 'School Bulletin',
        context: context,
        isFromSearch: IsFromSearch,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: DateSelectionWidget(),
            ),
            SizedBox(height: 16),
            Image.asset(coverImage),
            SizedBox(height: 8),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 16),
            Text(
              topic,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                randomText,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SyncVisionPdfViewer(
                        pdfSource:
                            'https://firebasestorage.googleapis.com/v0/b/maarif-567b8.appspot.com/o/School%20Health%20Information%20Form.pdf?alt=media&token=3e23d985-79cd-4bf3-863d-69945257b082&_gl=1*1weoa31*_ga*Mjg1MTAxOTg3LjE2ODIyNDk0MzA.*_ga_CW55HF8NVT*MTY4NjY1MjM1Mi4zMS4xLjE2ODY2NTI0NDYuMC4wLjA.',
                      ),
                    ),
                  );
                  print('Continue reading');
                },
                child: Text(
                  'Click to continue reading',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
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
