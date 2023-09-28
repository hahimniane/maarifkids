import 'package:flutter/material.dart';

import 'package:maarifkids/utils/pdf_viewer_page.dart';


import '../../contants.dart';
import '../../utils/custom_date_picker.dart';
import '../menu_page.dart';
import '../../utils/custom_nav_bar.dart';

class GelisimTakipPage extends StatelessWidget {
  final bool isFromSearch;
  const GelisimTakipPage({super.key, required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Progress Tracking',
        context: context,
        isFromSearch: isFromSearch,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateSelectionWidget(),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ImageWithTitle(
                      imageUrl:
                          'images/gelisim_takip.png', // Replace with your image URL
                      title: 'End of Term Achievements',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SyncVisionPdfViewer(
                              pdfSource:
                                  'https://firebasestorage.googleapis.com/v0/b/maarif-567b8.appspot.com/o/Alphabet%20Identification.pdf?alt=media&token=2272bf00-ad80-4a2f-919e-251654597a93',
                            ),
                          ),
                        );
                      }, // Replace with your desired title
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ImageWithTitle(
                      imageUrl:
                          'images/gelisim_takip_2.png', // Replace with your image URL
                      title: 'February achievement',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SyncVisionPdfViewer(
                              pdfSource:
                                  'https://firebasestorage.googleapis.com/v0/b/maarif-567b8.appspot.com/o/creative-child-like-best-teacher-school-certificate_23-2148933833.pdf?alt=media&token=ebd83321-c72e-4c78-91b7-e2980cb52656',
                            ),
                          ),
                        );
                      }, // Replace with your desired title
                    ),
                  ),
                ],
              ),
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
          }
        },
      ),
    );
  }
}

class ImageWithTitle extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  ImageWithTitle({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: parentAppColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


