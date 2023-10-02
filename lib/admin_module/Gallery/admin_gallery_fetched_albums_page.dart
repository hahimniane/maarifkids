import 'dart:ui';

import 'package:flutter/material.dart';

import '../../contants.dart';
import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';
import '../../test_page.dart';
import 'media_display_page.dart';

class FetchedAlbumsPage extends StatelessWidget {
  const FetchedAlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: buildAppBar(
        isAdminColor: true,
        title: 'Gallery',
        context: context,
        isFromSearch: false,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 70,
            color: profileSecimiBackgroundColor,
            child: Center(
              child: Text(
                'Class A',
                style: TextStyle(
                    color: adminAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  MediaDisplayPage(
                                    isFromSearch: false,
                                  ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: Tween<double>(begin: 0, end: 1)
                                  .animate(animation),
                              child: child,
                            );
                          }));
                  // animatedRoute(context, AlbumViewerPage);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AlbumViewerPage()));
                },
                child: Stack(
                  children: [
                    Container(
                      color: Colors.blue,
                      child: Image.asset(
                        'images/istockphoto-1138365810-612x612.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '20 March 2023 Photos',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '32 Photos/2Videos',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    color: Colors.blue,
                    child: Image.asset(
                      'images/istockphoto-1323715308-612x612.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Field Trip Album',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '10Photos/4Videos',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Stack(
          //       children: [
          //         Container(
          //           color: Colors.blue,
          //           child: Image.asset(
          //             'images/1647011757459939023.jpg',
          //             fit: BoxFit.cover,
          //             width: double.infinity,
          //             height: double.infinity,
          //           ),
          //         ),
          //         Positioned(
          //           bottom: 16,
          //           left: 16,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'Jan 2023',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 24,
          //                 ),
          //               ),
          //               Text(
          //                 'Photos and Videos',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 16,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         BackdropFilter(
          //           filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          //           child: Container(
          //             color: Colors.grey.withOpacity(0.3),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 15.0),
          //   child: Container(
          //       color: Colors.white,
          //       height: 70,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           GestureDetector(
          //             onTap: () {
          //               Navigator.pop(context);
          //             },
          //             child: Icon(
          //               Icons.home,
          //               size: 30,
          //               color: MainColor,
          //             ),
          //           ),
          //           SizedBox(
          //             width: 50,
          //           ),
          //           Icon(
          //             Icons.search,
          //             size: 30,
          //             color: MainColor,
          //           )
          //         ],
          //       )),
          // ),
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
