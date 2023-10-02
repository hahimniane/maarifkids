import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:maarifkids/contants.dart';
import 'package:video_player/video_player.dart';

import '../../menu_page.dart';
import '../../utils/custom_nav_bar.dart';

class AllPhototosPage extends StatefulWidget {
  final bool isFromSearch;
  const AllPhototosPage({super.key, required this.isFromSearch});

  @override
  _AllPhototosPageState createState() => _AllPhototosPageState();
}

class _AllPhototosPageState extends State<AllPhototosPage> {
  late VideoPlayerController _controller;
  int _currentPhotoIndex = 0;

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7F7F8),
      appBar: buildAppBar(
        title: 'Gallery',
        context: context,
        isFromSearch: widget.isFromSearch,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Class A',
              style: TextStyle(
                color: parentAppColor,
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
                color: parentAppColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 250,
                viewportFraction: 0.95,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentPhotoIndex = index;
                  });
                },
              ),
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                  margin: EdgeInsets.all(2),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('images/frame_2_delay-2.01s.jpg'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                  margin: EdgeInsets.all(2),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('images/frame_1_delay-2s.jpg'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.blue,
                  margin: EdgeInsets.all(2),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('images/frame_0_delay-2s.jpg'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  GestureDetector(
                    onTap: () {
                      carouselController.animateToPage(i);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPhotoIndex == i
                            ? parentAppColor
                            : Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 16),
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              height: 250,
              viewportFraction: 0.95,
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, _) {
                setState(() {
                  _currentPhotoIndex = index;
                });
              },
            ),
            items: [
              // Center(
              //   child: _controller.value.isInitialized
              //       ? AspectRatio(
              //           aspectRatio: _controller.value.aspectRatio,
              //           child: VideoPlayer(_controller),
              //         )
              //       : CircularProgressIndicator(),
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
                margin: EdgeInsets.all(2),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('images/frame_1_delay-2s.jpg'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
                margin: EdgeInsets.all(2),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('images/frame_1_delay-2s.jpg'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.blue,
                margin: EdgeInsets.all(2),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('images/frame_0_delay-2s.jpg'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  GestureDetector(
                    onTap: () {
                      carouselController.animateToPage(i);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPhotoIndex == i
                            ? parentAppColor
                            : Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Expanded(
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       Container(
          //         height: 200,
          //         width: 200,
          //         color: Colors.orange,
          //         margin: EdgeInsets.all(8),
          //       ),
          //       Container(
          //         height: 200,
          //         width: 200,
          //         color: Colors.purple,
          //         margin: EdgeInsets.all(8),
          //       ),
          //       Container(
          //         height: 200,
          //         width: 200,
          //         color: Colors.yellow,
          //         margin: EdgeInsets.all(8),
          //       ),
          //     ],
          //   ),
          // ),
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
