import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maarifkids/Parents_app_pages/Components/pdf_viewer_page.dart';

import 'package:maarifkids/contants.dart';

import '../../test_page.dart';
import '../app_initial_page.dart';
import '../home_page.dart';
import '../menu_page.dart';
import 'custom_nav_bar.dart';

class AnnouncementDetailsPage extends StatelessWidget {
  final String heading;
  final String description;
  final bool isFromSearch;

  const AnnouncementDetailsPage({
    required this.heading,
    required this.description, required this.isFromSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7F7F8),
      // backgroundColor: Colors.blue,
      appBar: buildAppBar(title: 'Announcement Detail', context: context, isFromSearch: isFromSearch,),

      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            Expanded(
              flex: 18,
              child: SizedBox(
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width * 1.0,
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              heading,
                              style: TextStyle(
                                color: MainColor,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            description,
                            style: TextStyle(
                              color: MainColor,
                              wordSpacing: 3,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Toplantida ele alinacak konular;',
                            style: TextStyle(
                              color: MainColor,
                              wordSpacing: 3,
                              fontSize: 16.0,
                            ),
                          ),
                          Container(
                            // color: Colors.orange,
                            height: 350,
                            child: ListView(
                              padding: const EdgeInsets.all(16.0),
                              children: [
                                buildListTile(string: 'Yemek Menusu'),
                                buildListTile(string: 'Ders Programlari'),
                                buildListTile(string: 'Vaz Okulu Takvimi'),
                                buildListTile(string: 'Gezi Planlari'),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Ekler',
                                  style: TextStyle(
                                    color: MainColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SyncVisionPdfViewer(
                                                pdfUrl:
                                                    'https://firebasestorage.googleapis.com/v0/b/maarif-567b8.appspot.com/o/School%20Health%20Information%20Form.pdf?alt=media&token=3e23d985-79cd-4bf3-863d-69945257b082&_gl=1*1weoa31*_ga*Mjg1MTAxOTg3LjE2ODIyNDk0MzA.*_ga_CW55HF8NVT*MTY4NjY1MjM1Mi4zMS4xLjE2ODY2NTI0NDYuMC4wLjA.',
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.solidFilePdf,
                                          size: 30,
                                          color: Color(0xffC30D05),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        FontAwesomeIcons.solidFilePdf,
                                        size: 30,
                                        color: Color(0xffC30D05),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 15.0),
                          //   child: Container(
                          //       color: Colors.white,
                          //       height: 70,
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
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
                    ),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(
            //         Icons.search,
            //         // size: 30,
            //         color: MainColor,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          }
         else if (value == 1) {

       Navigator.push(context,      MaterialPageRoute(builder: (context) => SearchFieldSample()));
          }
        },
      ),
    );
  }

  ListTile buildListTile({required String string}) {
    return ListTile(
      leading: Text('\u2022',
          style: TextStyle(
            fontSize: 16,
            color: MainColor,
          )), // Unicode bullet character
      title: Text(
        string,
        style: TextStyle(
          color: MainColor,
        ),
      ),
    );
  }
}

class PersistentBottomBarScaffold extends StatefulWidget {
  /// pass the required items for the tabs and BottomNavigationBar
  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  _PersistentBottomBarScaffoldState createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Check if the current tab can be popped
        if (widget.items[_selectedTab].navigatorKey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorKey?.currentState?.pop();
          return false;
        } else {
          // If the current tab can't be popped, use the root navigator
          return true;
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items
              .map((page) => Navigator(
                    key: page.navigatorKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.tab)
                      ];
                    },
                  ))
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) {
            if (index == _selectedTab) {
              // Handle the home icon click
              widget.items[_selectedTab].navigatorKey?.currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _selectedTab = index;
              });
            }
          },
          items: widget.items
              .map(
                (item) => BottomNavigationBarItem(
                  backgroundColor:
                      _selectedTab == 0 ? Colors.white : Colors.black,
                  tooltip: item.title,
                  icon: Icon(item.icon),
                  label: item.title,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String title;
  final IconData icon;

  PersistentTabItem(
      {required this.tab,
      this.navigatorKey,
      required this.title,
      required this.icon});
}

List<PersistentTabItem> tabItems = [
  PersistentTabItem(
    tab: MenuPage(), // Replace `MyHomePage()` with your own tab widget.
    title: 'Home',
    icon: Icons.home,
  ),
  PersistentTabItem(
    tab: HomePage(), // Replace `SettingsPage()` with your own tab widget.
    title: 'Settings',
    icon: Icons.search,
  ),
  // Add more tab items as needed.
];
