import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maarifkids/Pages/Components/school_buletin_page.dart';
import 'package:maarifkids/Pages/Components/service_page.dart';
import 'package:maarifkids/admin_module/Announcement/admin_announcement_dynamic_popup_menu_button.dart';
import '../admin_module/Announcement/admin_announcement_page.dart';
import '../admin_module/Gallery/admin_gallery_page.dart';
import '../admin_module/EventProgram/admin_activity_page.dart';
import '../admin_module/Messages/admin_messages_page.dart';

import '../contants.dart';
import '../widgets/navigator_class.dart';
import 'Components/Etkinlik_program_page.dart';
import 'Components/attendance_page.dart';
import 'Components/duyrular_page.dart';
import 'Components/food_page.dart';
// import 'Components/gallery_page.dart';
import 'Components/gun_sonu_rapor_page.dart';
import 'Components/messages_page.dart';
import 'Components/saglik_page.dart';

class MenuPage extends StatelessWidget {
  final CarouselController carouselController = CarouselController();

  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffD0F0F1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(),
                      // color: Colors.blue,
                      height: 100,
                      width: 100,
                      child: const CircleAvatar(
                        foregroundImage: AssetImage(
                          'images/yavuz_selim.jpeg',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Expanded(
                    flex: 0,
                    child: Text(
                      'Yavuz Selim Sultan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text('(Öğrenci)'),
                  const Text('Boy:1.15 cm-kilo: 20')
                ],
              ),
            ),
          ),

          ///this contains me

          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.48,
              // color: Colors.blue,
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Center(
                child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  mainAxisSpacing: 40,
                  crossAxisSpacing: 55,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: [
                    _buildMenuItem(
                      icon: const AssetImage(
                          'images/information-speaker-notification-announcement-512.ico'),
                      // icon: Icons.notification_important_rounded,
                      label: 'Announcement',
                      color: const Color(0xffF55B5B),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DuyrularPage(),
                        //   ),
                        // );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminAnnouncementPage(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.camera_alt,
                      label: 'Galerry',
                      color: const Color(0xff0CA789),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GalleryPage(
                                  // isFromSearch: false,
                                )));

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => GalleryPage(
                        //               isFromSearch: false,
                        //             )));
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.mark_chat_unread_rounded,
                      label: 'Messages',
                      color: const Color(0xffFAC711),
                      onTap: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminMessagesPage(
                                      isFromSearch: false,
                                    )));


                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MessagesPage(
                        //               isFromSearch: false,
                        //             )));
                      },
                    ),
                    _buildMenuItem(
                      icon: FontAwesomeIcons.puzzlePiece,
                      label: 'Event Program',
                      color: const Color(0xff2D9BF0),
                      onTap: () {
                        NavigationHelper.pushPage(context, AdminActivityPage());
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const EtkinlikPage(
                        //               isFromSearch: false,
                        //             )));
                      },
                    ),
                    _buildMenuItem(
                      icon: FontAwesomeIcons.plus,
                      label: 'Progress Tracking',
                      color: const Color(0xff414BB2),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GelisimTakipPage(
                                      isFromSearch: false,
                                    )));
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.restaurant,
                      label: 'Food List',
                      color: const Color(0xff652CB3),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodPage(
                                      isFromSearch: false,
                                    )));
                      },
                    ),
                    _buildMenuItem(
                      icon: FontAwesomeIcons.heartCrack,
                      label: 'Health',
                      color: const Color(0xff14CDD4),
                      onTap: () {
                        NavigationHelper.pushPage(
                            context,
                            const HealthWelcomePage(
                              isFromSearch: false,
                            ));
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.checklist,
                      label: 'Attendance',
                      color: const Color(0xff050039),
                      onTap: () {
                        NavigationHelper.pushPage(
                            context,
                            const AttendancePage(
                              isFromSearch: false,
                            ));
                      },
                    ),
                    _buildMenuItem(
                      icon: FontAwesomeIcons.bus,
                      label: 'School Service',
                      color: const Color(0xffDA0064),
                      onTap: () {
                        NavigationHelper.pushPage(
                            context,
                            const ServicePage(
                              isFromSearch: false,
                            ));
                      },
                    ),
                    const SizedBox(),
                    _buildMenuItem(
                      icon: FontAwesomeIcons.bookOpen,
                      label: 'School Bulletin',
                      color: const Color(0xffF24727),
                      onTap: () {
                        NavigationHelper.pushPage(
                            context,
                            const SchoolBulettinPage(
                              isFromSearch: false,
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      {required var icon,
      required String label,
      Color? color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon is IconData
              ? Icon(
                  icon,
                  color: color,
                  size: 24,
                )
              : Image(
                  image: icon,
                  height: 40,
                  color: const Color(0xffF55B5B),
                ),
          const SizedBox(height: 2.0),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0, fontWeight: FontWeight.bold, color: color),
            ),
          ),
        ],
      ),
    );
  }
}


