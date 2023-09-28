import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:maarifkids/admin_module/Announcement/admin_announcement_dynamic_popup_menu_button.dart';
import 'package:maarifkids/admin_module/Progress%20Tracking/admin_progress_tracking_home_page.dart';
import 'package:provider/provider.dart';
import '../Providers/Providers.dart';
import '../admin_module/Announcement/admin_announcement_page.dart';
import '../admin_module/Bulletin/admin_buletin_home_page.dart';
import '../admin_module/Food/admin_food_home_page.dart';
import '../admin_module/Gallery/admin_gallery_page.dart';
import '../admin_module/EventProgram/admin_activity_page.dart';
import '../admin_module/Health/admin_health_home_page.dart';
import '../admin_module/Messages/admin_messages_page.dart';

import '../contants.dart';
import '../theme.dart';
import '../widgets/navigator_class.dart';
import 'EventProgram/Etkinlik_program_page.dart';
import 'Attendance/attendance_page.dart';
import 'Announcement/duyrular_page.dart';
import 'Food/food_page.dart';
import 'Bulletin/school_buletin_page.dart';
import 'Health/saglik_page.dart';
import 'Service/service_page.dart';
import 'Gallery/gallery_page.dart';
import 'Gallery/gallery_page.dart';
import 'ProgressTracking/gun_sonu_rapor_page.dart';
import 'Components/Messages/messages_page.dart';


class MenuPage extends StatelessWidget {
  final CarouselController carouselController = CarouselController();

  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: true);
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
                      // icon: const AssetImage(
                      //     'images/information-speaker-notification-announcement-512.ico'),
                      icon: Icons.notification_important_rounded,
                      label: 'Announcement',
                      color: const Color(0xffF55B5B),
                      onTap: () {
                        provider.activeThemeData == ParentTheme.lightTheme()
                            ? NavigationHelper.pushPage(context, DuyrularPage())
                            : NavigationHelper.pushPage(
                                context,
                                AdminAnnouncementPage(),
                              );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.camera_alt,
                      label: 'Galerry',
                      color: const Color(0xff0CA789),
                      onTap: () {
                        provider.activeThemeData == ParentTheme.lightTheme()
                            ? NavigationHelper.pushPage(
                                context,
                                GalleryPage(
                                  isFromSearch: false,
                                ))
                            : NavigationHelper.pushPage(
                                context,
                                AdminGalleryPage(
                                    // isFromSearch: false,
                                    ),
                              );
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.mark_chat_unread_rounded,
                      label: 'Messages',
                      color: const Color(0xffFAC711),
                      onTap: () {
                        provider.activeThemeData == ParentTheme.lightTheme()
                            ? NavigationHelper.pushPage(
                                context,
                                MessagesPage(
                                  isFromSearch: false,
                                ))
                            : NavigationHelper.pushPage(
                                context,
                                AdminMessagesPage(
                                  isFromSearch: false,
                                ),
                              );
                      },
                    ),
                    _buildMenuItem(
                      icon: FontAwesomeIcons.puzzlePiece,
                      label: 'Event Program',
                      color: const Color(0xff2D9BF0),
                      onTap: () {

                        provider.activeThemeData == ParentTheme.lightTheme()
                            ? NavigationHelper.pushPage(
                            context,
                            EtkinlikPage(
                              isFromSearch: false,
                            ))
                            : NavigationHelper.pushPage(
                          context,
                            AdminActivityPage()
                        );


                      },
                    ),
                    _buildMenuItem(
                      icon: FontAwesomeIcons.plus,
                      label: 'Progress Tracking',
                      color: const Color(0xff414BB2),
                      onTap: () {


                        provider.activeThemeData == ParentTheme.lightTheme()
                            ? NavigationHelper.pushPage(
                            context,
                            GelisimTakipPage(
                              isFromSearch: false,
                            ))
                            : NavigationHelper.pushPage(
                            context,
                            AdminProgressTrackingHomePage()
                        );


                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.restaurant,
                      label: 'Food List',
                      color: const Color(0xff652CB3),
                      onTap: () {


                        provider.activeThemeData == ParentTheme.lightTheme()
                            ? NavigationHelper.pushPage(
                            context,
                            FoodPage(
                              isFromSearch: false,
                            )
                        )
                            : NavigationHelper.pushPage(
                            context,
                            AdminFoodHomePage()
                        );


                        // AdminFoodHomePage

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => FoodPage(
                        //               isFromSearch: false,
                        //             )));
                      },
                    ),
                    _buildMenuItem(
                      icon: FontAwesomeIcons.heartCrack,
                      label: 'Health',
                      color: const Color(0xff14CDD4),
                      onTap: () {
                        provider.activeThemeData == ParentTheme.lightTheme()
                            ? NavigationHelper.pushPage(
                            context,
                            HealthWelcomePage(
                              isFromSearch: false,
                            )
                        )
                            : NavigationHelper.pushPage(
                            context,
                            AdminHealthHomePage()
                        );
                        // NavigationHelper.pushPage(
                        //     context,
                        //     const HealthWelcomePage(
                        //       isFromSearch: false,
                        //     ));
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
                        provider.activeThemeData == ParentTheme.lightTheme()
                            ? NavigationHelper.pushPage(
                            context,
                            SchoolBulettinPage(
                              isFromSearch: false,
                            ))
                            : NavigationHelper.pushPage(
                            context,
                            AdminSchoolBulletinHomePage()
                        );


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
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
    );
  }
}
