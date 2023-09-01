import 'package:flutter/material.dart';
import 'package:maarifkids/Pages/Components/announcement_details_page.dart';
import 'package:maarifkids/Pages/Components/pdf_viewer_page.dart';

import '../../contants.dart';
import '../menu_page.dart';
import 'custom_nav_bar.dart';

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

class DateSelectionWidget extends StatefulWidget {
  const DateSelectionWidget({super.key});

  @override
  _DateSelectionWidgetState createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  DateTime? _selectedDate = DateTime.now();

  final List<String> _dates = [
    '2022-2023',
    '2021-2022',
    '2020-2021',
    // Add more dates here as needed
  ];

  @override
  Widget build(BuildContext context) {
    // _selectedDate=_dates.first;
    return GestureDetector(
      onTap: _showDatePicker,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.48,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Icon(
                Icons.calendar_today,
                color: parentAppColor,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              _selectedDate != null
                  ? '${_selectedDate?.year}-${_selectedDate!.year + 1}'
                  : 'Select Date',
              style: TextStyle(
                  fontSize: 16,
                  color: parentAppColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.arrow_drop_down,
              color: parentAppColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() async {
    var selectedDate = await showDialog<DateTime>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select a Date'),
          content: SingleChildScrollView(
            child: Column(
              children: _dates.map((date) {
                return ListTile(
                  title: Text(
                    date,
                    style: TextStyle(
                      color: parentAppColor,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pop(DateTime(int.parse(date.substring(0, 4))));
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  // This method will return a List of two images based on the selected date
  List<String>? getImagesForSelectedDate() {
    if (_selectedDate == null) {
      print('is null');
      return null; // Return null if no date is selected
    } else {
      print('adding logic here');
      // Add your logic here to fetch the images for the selected date
      // and return a List of two image URLs or paths.
      // For now, we'll return a placeholder List.
      return ['image_url_1', 'image_url_2'];
    }
  }

  @override
  void initState() {
    super.initState();
  }
}
