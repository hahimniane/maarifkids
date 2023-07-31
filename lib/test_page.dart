// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
//
//
// void main() => runApp(const PersistenBottomNavBarDemo());
//
// class PersistenBottomNavBarDemo extends StatelessWidget {
//   const PersistenBottomNavBarDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Persistent Bottom Navigation Bar Demo',
//       home: MainMenu(),
//       initialRoute: '/',
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/first': (context) => MainScreen2(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/second': (context) => MainScreen3(),
//       },
//     );
//   }
// }
//
// class MainScreen3 extends StatelessWidget {
//   const MainScreen3({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
//
// class MainScreen2 extends StatelessWidget {
//   const MainScreen2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
// class MainMenu extends StatefulWidget {
//   MainMenu({ Key? key}) : super(key: key);
//
//   @override
//   _MainMenuState createState() => _MainMenuState();
// }
//
// class _MainMenuState extends State<MainMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Navigation Bar Demo"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             child: ElevatedButton(
//               child: Text("Custom widget example"),
//               onPressed: () => pushNewScreen(
//                 context,
//                 screen: CustomWidgetExample(),
//               ),
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Center(
//             child: ElevatedButton(
//               child: Text("Built-in style example"),
//               onPressed: () => pushNewScreen(
//                 context,
//                 screen: ProvidedStyleExample(),
//               ),
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Center(
//             child: ElevatedButton(
//               child: Text("Interactive Example"),
//               onPressed: () => pushNewScreen(
//                 context,
//                 screen: InteractiveExample(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class InteractiveExample extends StatelessWidget {
//   const InteractiveExample({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
//
// // ----------------------- Using a provided Navbar style ---------------------//
//
// class ProvidedStyleExample extends StatefulWidget {
//   ProvidedStyleExample({Key? key}) : super(key: key);
//
//   @override
//   _ProvidedStyleExampleState createState() => _ProvidedStyleExampleState();
// }
//
// class _ProvidedStyleExampleState extends State<ProvidedStyleExample> {
//   PersistentTabController? _controller;
//   bool? _hideNavBar;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//     _hideNavBar = false;
//   }
//
//   List<Widget> _buildScreens() {
//     return [
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar!;
//           });
//         },
//       ),
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar!;
//           });
//         },
//       ),
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar!;
//           });
//         },
//       ),
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar!;
//           });
//         },
//       ),
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar!;
//           });
//         },
//       ),
//     ];
//   }
//
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.home),
//         title: "Home",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//         inactiveColorSecondary: Colors.purple,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.search),
//         title: "Search",
//         activeColorPrimary: Colors.teal,
//         inactiveColorPrimary: Colors.grey,
//         routeAndNavigatorSettings: RouteAndNavigatorSettings(
//           initialRoute: '/',
//           routes: {
//             '/first': (context) => MainScreen2(),
//             '/second': (context) => MainScreen3(),
//           },
//         ),
//       ),
//       PersistentBottomNavBarItem(
//           icon: Icon(Icons.add),
//           title: "Add",
//           activeColorPrimary: Colors.blueAccent,
//           activeColorSecondary: Colors.white,
//           inactiveColorPrimary: Colors.white,
//           routeAndNavigatorSettings: RouteAndNavigatorSettings(
//             initialRoute: '/',
//             routes: {
//               '/first': (context) => MainScreen2(),
//               '/second': (context) => MainScreen3(),
//             },
//           ),
//           onPressed: (context) {
//             pushDynamicScreen(context!,
//                 screen: SampleModalScreen(), withNavBar: true);
//           }),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.message),
//         title: "Messages",
//         activeColorPrimary: Colors.deepOrange,
//         inactiveColorPrimary: Colors.grey,
//         routeAndNavigatorSettings: RouteAndNavigatorSettings(
//           initialRoute: '/',
//           routes: {
//             '/first': (context) => MainScreen2(),
//             '/second': (context) => MainScreen3(),
//           },
//         ),
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.settings),
//         title: "Settings",
//         activeColorPrimary: Colors.indigo,
//         inactiveColorPrimary: Colors.grey,
//         routeAndNavigatorSettings: RouteAndNavigatorSettings(
//           initialRoute: '/',
//           routes: {
//             '/first': (context) => MainScreen2(),
//             '/second': (context) => MainScreen3(),
//           },
//         ),
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Navigation Bar Demo')),
//       // drawer: Drawer(
//       //   child: Center(
//       //     child: Column(
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: <Widget>[
//       //         const Text('This is the Drawer'),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//       body: PersistentTabView(
//         context,
//         controller: _controller,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         confineInSafeArea: true,
//         backgroundColor: Colors.white,
//         handleAndroidBackButtonPress: true,
//         resizeToAvoidBottomInset: true,
//         stateManagement: true,
//         navBarHeight: kBottomNavigationBarHeight,
//         hideNavigationBarWhenKeyboardShows: true,
//         margin: EdgeInsets.all(0.0),
//         popActionScreens: PopActionScreensType.all,
//         bottomScreenMargin: 0.0,
//         onWillPop: (context) async {
//           await showDialog(
//             context: context!,
//             useSafeArea: true,
//             builder: (context) => Container(
//               height: 50.0,
//               width: 50.0,
//               color: Colors.white,
//               child: ElevatedButton(
//                 child: Text("Close"),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           );
//           return false;
//         },
//         hideNavigationBar: _hideNavBar,
//         decoration: NavBarDecoration(
//             colorBehindNavBar: Colors.indigo,
//             borderRadius: BorderRadius.circular(20.0)),
//         popAllScreensOnTapOfSelectedTab: true,
//         itemAnimationProperties: ItemAnimationProperties(
//           duration: Duration(milliseconds: 400),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle:
//         NavBarStyle.style17, // Choose the nav bar style with this property
//       ),
//     );
//   }
// }
//
// class SampleModalScreen extends StatelessWidget {
//   const SampleModalScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
//
// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key, required Null Function() onScreenHideButtonPressed, bool? hideStatus}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       child: Center(
//         child: ElevatedButton(
//           child: Text('hi'),
//           onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>ButtonPage()));
//           },
//         )
//       ),
//     );
//   }
// }
//
//
// // ------------------------ Using a custom Navbar style ----------------------//
//
// class CustomWidgetExample extends StatefulWidget {
//   CustomWidgetExample({Key? key}) : super(key: key);
//
//   @override
//   _CustomWidgetExampleState createState() => _CustomWidgetExampleState();
// }
//
// class _CustomWidgetExampleState extends State<CustomWidgetExample> {
//   late PersistentTabController _controller;
//   late bool _hideNavBar;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//     _hideNavBar = false;
//   }
//
//   List<Widget> _buildScreens() {
//     return [
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//       MainScreen(
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//     ];
//   }
//
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.home),
//         title: "Home",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.search),
//         title: ("Search"),
//         activeColorPrimary: Colors.teal,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.add),
//         title: ("Add"),
//         activeColorPrimary: Colors.deepOrange,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.settings),
//         title: ("Settings"),
//         activeColorPrimary: Colors.indigo,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.settings),
//         title: ("Settings"),
//         activeColorPrimary: Colors.indigo,
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Navigation Bar Demo')),
//       drawer: Drawer(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text('This is the Drawer'),
//             ],
//           ),
//         ),
//       ),
//       body: PersistentTabView.custom(
//         context,
//         controller: _controller,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         confineInSafeArea: true,
//         itemCount: 5,
//         handleAndroidBackButtonPress: true,
//         stateManagement: true,
//         hideNavigationBar: _hideNavBar,
//         screenTransitionAnimation: ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         customWidget: (navBarEssentials) => CustomNavBarWidget(
//           items: _navBarsItems(),
//           onItemSelected: (index) {
//             setState(() {
//               navBarEssentials.onItemSelected!(index);
//             });
//           },
//           selectedIndex: _controller.index,
//         ),
//       ),
//     );
//   }
// }
//
// class CustomNavBarWidget extends StatelessWidget {
//   final int? selectedIndex;
//   final List<PersistentBottomNavBarItem>? items;
//   final ValueChanged<int>? onItemSelected;
//
//   CustomNavBarWidget({
//     Key? key,
//     this.selectedIndex,
//     @required this.items,
//     this.onItemSelected,
//   });
//
//   Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
//     return Container(
//       alignment: Alignment.center,
//       height: kBottomNavigationBarHeight,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Flexible(
//             child: IconTheme(
//               data: IconThemeData(
//                   size: 26.0,
//                   color: isSelected
//                       ? (item.activeColorSecondary == null
//                       ? item.activeColorPrimary
//                       : item.activeColorSecondary)
//                       : item.inactiveColorPrimary == null
//                       ? item.activeColorPrimary
//                       : item.inactiveColorPrimary),
//               child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: Material(
//               type: MaterialType.transparency,
//               child: FittedBox(
//                 child: Text(
//                   item.title!,
//                   style: TextStyle(
//                       color: isSelected
//                           ? (item.activeColorSecondary == null
//                           ? item.activeColorPrimary
//                           : item.activeColorSecondary)
//                           : item.inactiveColorPrimary,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12.0),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Container(
//         width: double.infinity,
//         height: kBottomNavigationBarHeight,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: items!.map((item) {
//             int index = items!.indexOf(item);
//             return Expanded(
//               child: InkWell(
//                 onTap: () {
//                   onItemSelected!(index);
//                 },
//                 child: _buildItem(item, selectedIndex == index),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
// class ButtonPage extends StatelessWidget {
//   const ButtonPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
import 'package:flutter/material.dart';
import 'package:maarifkids/Pages/Components/Etkinlik_program_page.dart';
import 'package:maarifkids/Pages/Components/gallery_page.dart';
import 'package:maarifkids/contants.dart';
import 'package:searchfield/searchfield.dart';

import 'Pages/Components/food_page.dart';
import 'Pages/Components/messages_page.dart';

class SearchFieldSample extends StatefulWidget {
  const SearchFieldSample({super.key});

  @override
  _SearchFieldSampleState createState() => _SearchFieldSampleState();
}

class _SearchFieldSampleState extends State<SearchFieldSample> {
  int count = 0;
  final TextEditingController _searchController = TextEditingController();
  List<SearchFieldListItem<String>> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchField(
            searchStyle: TextStyle(
              color: MainColor,
            ),
            suggestionItemDecoration: SuggestionDecoration(
              // shape: BoxShape.circle,
              border: Border.all(color: MainColor),
              color: MainColor,
            ),
            onSearchTextChanged: (query) {
              setState(() {
                _searchResults = generateSearchItems(query);
              });
            },
            key: const Key('searchfield'),
            hint: 'Search pages...',
            itemHeight: 50,
            suggestionsDecoration: SuggestionDecoration(
              padding: const EdgeInsets.all(4),
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suggestions: _searchResults,
            suggestionState: Suggestion.expand,
            onSuggestionTap: (SearchFieldListItem<String> item) {
              switch (item.searchKey) {

                case 'Gallery':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GalleryPage(
                                isFromSearch: true,
                              )));
                case 'Messages':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessagesPage(
                            isFromSearch: true,
                              )));
                case 'Event Programme':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EtkinlikPage(
                            isFromSearch: true,
                          )));
                default:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FoodPage()));

              }
            }),
      ),
      body: Center(
          // Your main content here
          ),
    );
  }

  List<SearchFieldListItem<String>> generateSearchItems(String query) {
    final filter = allPages
        .where((page) => page.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return filter
        .map((e) => SearchFieldListItem<String>(
              e,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  e,
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
              ),
            ))
        .toList();
  }
}

List<String> allPages = [
  "Gallery",
  "Messages",
  "Event Programme",
  "Progress Tracking",
  "Food List",
  'Health',
  'Attendance',
  'School Service',
  'School Bulletin',

  // Add other page names or identifiers here
];

// class SearchFieldSample extends StatefulWidget {
//   const SearchFieldSample({Key? key}) : super(key: key);
//
//   @override
//   State<SearchFieldSample> createState() => _SearchFieldSampleState();
// }
//
// class _SearchFieldSampleState extends State<SearchFieldSample> {
//   int suggestionsCount = 12;
//   final focus = FocusNode();
//   @override
//   Widget build(BuildContext context) {
//     final suggestions =
//     List.generate(suggestionsCount, (index) => 'suggestion $index');
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Dynamic sample Demo'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               suggestionsCount++;
//               suggestions.add('suggestion $suggestionsCount');
//             });
//           },
//           child: const Icon(Icons.add),
//         ),
//         body: Center(
//           child: SearchField(
//             onSearchTextChanged: (query) {
//               final filter = suggestions
//                   .where((element) =>
//                   element.toLowerCase().contains(query.toLowerCase()))
//                   .toList();
//               return filter
//                   .map((e) => SearchFieldListItem<String>(e,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 4.0),
//                     child: Text(e,
//                         style: TextStyle(fontSize: 24, color: Colors.red)),
//                   )))
//                   .toList();
//             },
//             key: const Key('searchfield'),
//             hint: 'Search by country name',
//             itemHeight: 50,
//             suggestionsDecoration: SuggestionDecoration(
//                 padding: const EdgeInsets.all(4),
//                 border: Border.all(color: Colors.red),
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             suggestions: suggestions
//                 .map((e) => SearchFieldListItem<String>(e,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4.0),
//                   child: Text(e,
//                       style: TextStyle(fontSize: 24, color: Colors.red)),
//                 )))
//                 .toList(),
//             focusNode: focus,
//             suggestionState: Suggestion.expand,
//             onSuggestionTap: (SearchFieldListItem<String> x) {
//               focus.unfocus();
//             },
//           ),
//         ));
//   }
// }
