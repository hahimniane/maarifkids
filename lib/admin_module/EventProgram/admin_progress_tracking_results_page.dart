import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../../utils/custom_delete_functionality.dart';
import '../../utils/custom_nav_bar.dart';
import '../../utils/pdf_viewer_page.dart';
import '../../menu_page.dart';
import '../../utils/custom_date_picker.dart';

// class AdminProgressTrackingViewOldResultsPage extends StatelessWidget {
//   const AdminProgressTrackingViewOldResultsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
class AdminProgressTrackingViewOldResultsPage extends StatelessWidget {
  final bool isFromSearch;
  const AdminProgressTrackingViewOldResultsPage(
      {super.key, required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: progressTrackingString,
        context: context,
        isFromSearch: isFromSearch,
        isAdminColor: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Yavuz Selim Celiktas -351',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(alignment: Alignment.centerLeft, child: DateSelectionWidget()),
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
                      },
                      iconOnTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDeleteWidget(
                              title: "Delete Achievement",
                              content:
                                  'Are you sure you want to delete this achievement?',
                            );
                          },
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
                      },
                      iconOnTap: () {}, // Replace with your desired title
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
  final VoidCallback iconOnTap;

  ImageWithTitle({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
    required this.iconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
                IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: iconOnTap)
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
