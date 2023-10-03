import 'package:flutter/material.dart';

import '../utils/contants.dart';

import '../menu_page.dart';

class AdminProfileSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: buildAppBar(
        title: profileSelectionString,
        context: context,
        isFromSearch: false,
        isAdminColor:
            Theme.of(context).primaryColor == adminAppColor ? true : false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            profileSelectionStudentCardWidget(
              studentName: '',
              imageUrl: 'images/admin_images/img.png',
              studentNumber: '',
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
                        Text(
                          'Abdullah Nian\n   (ogrenci)',
                          style: TextStyle(
                            color: adminAppColor,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: adminAppColor),
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

class profileSelectionStudentCardWidget extends StatelessWidget {
  final String studentName;
  final String imageUrl;
  final String studentNumber;
  const profileSelectionStudentCardWidget({
    super.key,
    required this.studentName,
    required this.imageUrl,
    required this.studentNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                foregroundImage: AssetImage('images/admin_images/img.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yavuz Selim\n   (Teacher)',
                  style: TextStyle(fontSize: 20.0, color: adminAppColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.0),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: adminAppColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  },
                  child: Text(
                    'Select Profile ',
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
