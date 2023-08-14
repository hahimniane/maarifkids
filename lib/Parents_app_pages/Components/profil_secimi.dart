import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../admin_app_pages/constants.dart';
import '../../contants.dart';
import '../menu_page.dart';
import 'announcement_details_page.dart';

class ProfileSelectionPage extends StatelessWidget {
  final bool isItAdmin;
  ProfileSelectionPage({required this.isItAdmin});

  final parentTheme = ThemeData(

    buttonTheme: ButtonThemeData(
        buttonColor: Colors.teal
    ),
    primaryColor: Colors.teal,
    appBarTheme: AppBarTheme(color: Colors.teal), // Set the AppBar color
  );


  // Select the appropriate theme based on the user role



  @override
  Widget build(BuildContext context) {
    final adminTheme = ThemeData(
      primarySwatch: Colors.orange,
      textTheme:
      Theme.of(context).textTheme.apply(
        bodyColor: Colors.pinkAccent, //<-- SEE HERE
        displayColor: Colors.pinkAccent,
        //<-- SEE HERE
      ),

      buttonTheme: ButtonThemeData(
          buttonColor: Colors.orange
      ),
      primaryColor: Colors.orange,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
          // color: Colors.orange,
      ), // Set the AppBar color
    );
    final selectedTheme = isItAdmin ? adminTheme : parentTheme;
    print('admin mode is $isItAdmin');
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: AppBar(
        backgroundColor: MainColor,
        title: Text('Profile Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundImage: AssetImage('images/yavuz_selim.jpeg'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Yavuz Selim\n   (ogrenci)',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MainColor),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()),
                            );
                          },
                          child: Text(
                            'Profil Seç',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundImage: AssetImage('images/IMG_2103.png'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Abdullah Nian\n   (ogrenci)',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MainColor),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuPage()),
                            );
                          },
                          child: Text(
                            'Profil Seç',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Profili'),
      ),
      body: Center(
        child: Text('Öğrenci Profili'),
      ),
    );
  }
}
