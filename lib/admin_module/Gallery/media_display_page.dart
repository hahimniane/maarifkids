import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../contants.dart';
import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';

enum MediaType { image, video }

class MediaDisplayPage extends StatefulWidget {
  final bool isFromSearch;
  const MediaDisplayPage({super.key, required this.isFromSearch});

  @override
  _MediaDisplayPageState createState() => _MediaDisplayPageState();
}

class _MediaDisplayPageState extends State<MediaDisplayPage> {
  late VideoPlayerController _controller;
  int _currentPhotoIndex = 0;
  int _currentVideoIndex = 0;

  CarouselController photoCarouselController = CarouselController();
  CarouselController videoCarouselController = CarouselController();

  List<Widget> photosItems = [];
  List<Widget> videosItems = [];
  Future<void> showDeleteConfirmationDialog(
      BuildContext context, String imagePath, MediaType mediaType) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap buttons to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the radius as needed
          ),
          backgroundColor: adminAppColor, // Set your custom background color
          title: Text(
            mediaType == MediaType.image ? 'Delete Image' : 'Delete Video',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  mediaType == MediaType.image
                      ? 'Are you sure you want to permanently delete the photo?'
                      : 'Are you sure you want to permanently delete the video?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.white), // Customize text color
              ),
            ),
            TextButton(
              onPressed: () {
                // Implement your delete logic here
                setState(() {
                  int index = photosItems
                      .indexWhere((item) => item.key == ValueKey(imagePath));

                  if (index >= 0) {
                    photosItems.removeAt(index);
                    setState(() {
                      photosItems;
                    });
                    print('Removed item at index $index');
                    print(
                        'Number of elements in the list ${photosItems.length}');
                    print('The image path is $imagePath');
                  } else {
                    print('Item not found in the list.');
                  }
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.white), // Customize text color
              ),
            ),
          ],
        );
      },
    );
  }

  Widget createPhotoItem(String imagePath) {
    return Container(
      key: ValueKey(imagePath),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.delete, color: adminAppColor),
              onPressed: () {
                showDeleteConfirmationDialog(
                    context, imagePath, MediaType.image);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createVideoItem(String imagePath) {
    return Container(
      key: ValueKey(imagePath),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.delete, color: adminAppColor),
              onPressed: () {
                showDeleteConfirmationDialog(
                    context, imagePath, MediaType.video);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    photosItems = [
      createPhotoItem('images/frame_2_delay-2.01s.jpg'),
      createPhotoItem('images/frame_1_delay-2s.jpg'),
      createPhotoItem('images/frame_0_delay-2s.jpg'),
    ];
    videosItems = [
      createVideoItem('images/frame_1_delay-2s.jpg'),
      createVideoItem('images/frame_1_delay-2s.jpg'),
    ];

    // List<Widget> videoItems=[
    //
    //   Container(
    //     width: MediaQuery.of(context).size.width,
    //     // color: Colors.blue,
    //     margin: EdgeInsets.all(2),
    //     child: Image(
    //       fit: BoxFit.cover,
    //       image: AssetImage('images/frame_1_delay-2s.jpg'),
    //     ),
    //   ),
    //   Container(
    //     width: MediaQuery.of(context).size.width,
    //     // color: Colors.blue,
    //     margin: EdgeInsets.all(2),
    //     child: Image(
    //       fit: BoxFit.cover,
    //       image: AssetImage('images/frame_1_delay-2s.jpg'),
    //     ),
    //   ),
    //   Container(
    //     width: MediaQuery.of(context).size.width,
    //     // color: Colors.blue,
    //     margin: EdgeInsets.all(2),
    //     child: Image(
    //       fit: BoxFit.cover,
    //       image: AssetImage('images/frame_0_delay-2s.jpg'),
    //     ),
    //   ),
    // ];

    return Scaffold(
      backgroundColor: const Color(0xffE7F7F8),
      appBar: buildAppBar(
        isAdminColor: true,
        title: 'Gallery',
        context: context,
        isFromSearch: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Class A',
              style: TextStyle(
                color: adminAppColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'June 13, 2023',
              style: TextStyle(
                color: adminAppColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 3),
          Expanded(
            flex: 1,
            child: Builder(
              builder: (BuildContext context) {
                return CarouselSlider(
                  carouselController: photoCarouselController,
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 0.95,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentPhotoIndex = index;
                      });
                    },
                  ),
                  items: photosItems,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < photosItems.length; i++)
                  GestureDetector(
                    onTap: () {
                      photoCarouselController.animateToPage(i);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPhotoIndex == i
                            ? adminAppColor
                            : Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Expanded(
            child: CarouselSlider(
                carouselController: videoCarouselController,
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 0.95,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentVideoIndex = index;
                    });
                  },
                ),
                items: videosItems),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < videosItems.length; i++)
                  GestureDetector(
                    onTap: () {
                      videoCarouselController.animateToPage(i);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentVideoIndex == i
                            ? adminAppColor
                            : Colors.grey,
                      ),
                    ),
                  ),
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
          } else {
            print('search screen');
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.youtube.com/watch?v=ni3rzDdndhQ&ab_channel=Waqar-%D9%88%D9%82%D8%A7%D8%B1', // Replace with your video URL
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
      }).onError((error, stackTrace) {
        // print(stackTrace.toDart);
      });
  }
}
