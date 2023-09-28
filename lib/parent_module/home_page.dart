import 'package:flutter/material.dart';
import 'package:maarifkids/parent_module/profile_page.dart';
import 'package:maarifkids/parent_module/search_page.dart';


import 'menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static  final List<Widget> _widgetOptions = <Widget>[
   MenuPage(),
  const SearchPage(),
  const ProfilePage()
  ];

  Color iconsColor=Colors.white;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: iconsColor,

        showSelectedLabels: false,

        showUnselectedLabels: false,
        backgroundColor:const Color(0xffF99595) ,
        items:   const <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Icon(Icons.home,),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            label: 'Search',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:  Colors.black,

      ),
    );
  }
}
