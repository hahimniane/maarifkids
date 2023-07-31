// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// import '../../contants.dart';
//
// class AlbumViewerPage extends StatelessWidget {
//   const AlbumViewerPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MainColor,
//         title: Text('Galeris'),
//       ),
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             height: 70,
//             color: profileSecimiBackgroundColor,
//             child: Center(
//               child: Text(
//                 'A Sınıfı',
//                 style: TextStyle(
//                     color: MainColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 19),
//               ),
//             ),
//           ),
//           Container(
//             height: 200,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       PageRouteBuilder(
//                           transitionDuration: Duration(milliseconds: 500),
//                           pageBuilder:
//                               (context, animation, secondaryAnimation) =>
//                                   AlbumViewerPage(),
//                           transitionsBuilder:
//                               (context, animation, secondaryAnimation, child) {
//                             return FadeTransition(
//                               opacity: Tween<double>(begin: 0, end: 1)
//                                   .animate(animation),
//                               child: child,
//                             );
//                           }));
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => AlbumViewerPage()));
//                 },
//                 child: Stack(
//                   children: [
//                     Container(
//                       color: Colors.blue,
//                       child: Image.asset(
//                         'images/istockphoto-1138365810-612x612.jpg',
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: double.infinity,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 16,
//                       left: 16,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Jan 2023',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24,
//                             ),
//                           ),
//                           Text(
//                             'Photos/Videos',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w900,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
//                       child: Container(
//                         color: Colors.grey.withOpacity(0.3),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Expanded(
//           //   child: Padding(
//           //     padding: const EdgeInsets.all(8.0),
//           //     child: Stack(
//           //       children: [
//           //         Container(
//           //           color: Colors.blue,
//           //           child: Image.asset(
//           //             'images/istockphoto-1323715308-612x612.jpg',
//           //             fit: BoxFit.cover,
//           //             width: double.infinity,
//           //             height: double.infinity,
//           //           ),
//           //         ),
//           //         Positioned(
//           //           bottom: 16,
//           //           left: 16,
//           //           child: Column(
//           //             crossAxisAlignment: CrossAxisAlignment.start,
//           //             children: [
//           //               Text(
//           //                 'Jan 2023',
//           //                 style: TextStyle(
//           //                   color: Colors.white,
//           //                   fontWeight: FontWeight.bold,
//           //                   fontSize: 24,
//           //                 ),
//           //               ),
//           //               Text(
//           //                 'Photos and Videos',
//           //                 style: TextStyle(
//           //                   color: Colors.white,
//           //                   fontWeight: FontWeight.bold,
//           //                   fontSize: 16,
//           //                 ),
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //         BackdropFilter(
//           //           filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
//           //           child: Container(
//           //             color: Colors.grey.withOpacity(0.3),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//           Container(
//             height: 200,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Stack(
//                 children: [
//                   Container(
//                     color: Colors.blue,
//                     child: Image.asset(
//                       'images/1647011757459939023.jpg',
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 16,
//                     left: 16,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Jan 2023',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                           ),
//                         ),
//                         Text(
//                           'Photos and Videos',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
//                     child: Container(
//                       color: Colors.grey.withOpacity(0.3),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15.0),
//             child: Container(
//                 color: Colors.white,
//                 height: 70,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Icon(
//                         Icons.home,
//                         size: 30,
//                         color: MainColor,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 50,
//                     ),
//                     Icon(
//                       Icons.search,
//                       size: 30,
//                       color: MainColor,
//                     )
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maarifkids/Pages/menu_page.dart';

import '../../contants.dart';
import 'all_photos_page.dart';
import 'custom_nav_bar.dart';

class AlbumViewerPage extends StatefulWidget {
@override
  _AlbumViewerPageState createState() => _AlbumViewerPageState();
}

class _AlbumViewerPageState extends State<AlbumViewerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: AppBar(
        backgroundColor: MainColor,
        title: const Text('Gallery'),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 70,
                color: profileSecimiBackgroundColor,
                child: Center(
                  child: Text(
                    'Class A',
                    style: TextStyle(
                        color: MainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const AllPhototosPage(isFromSearch: false,),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: Tween<double>(begin: 0, end: 1)
                                  .animate(animation),
                              child: child,
                            );
                          }));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2.5)),
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.blue,
                            child: Image.asset(
                              'images/1647011757459939023.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jan 29 2023 Tüm fotoğraflar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  '32 fotoğraf/video',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                            child: Container(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.5)),
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.blue,
                          child: Image.asset(
                            'images/1647011757459939023.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jan 29 2023 çanakkale gezisi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                '9 fotoğraf/video',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: SizedBox(
          //     height: 100,
          //     width: 30,
          //     child: Card(
          //       elevation: 40,
          //       child: Container(
          //           color: Colors.white,
          //           height: 70,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               GestureDetector(
          //                 onTap: () {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                       builder: (context) => MenuPage(),
          //                     ),
          //                   );
          //                 },
          //                 child: Icon(
          //                   Icons.home,
          //                   size: 30,
          //                   color: MainColor,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 width: 50,
          //               ),
          //               Icon(
          //                 Icons.search,
          //                 size: 30,
          //                 color: MainColor,
          //               )
          //             ],
          //           )),
          //     ),
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
          }
        },
      ),
    );
  }
}
