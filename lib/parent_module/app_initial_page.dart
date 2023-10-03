import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/contants.dart';
import '../utils/search_functionality.dart';
import 'profil_secimi.dart';
import 'api_deneme.dart';
import 'login_page.dart';

class AppInitialPage extends StatefulWidget {
  const AppInitialPage({Key? key}) : super(key: key);

  @override
  State<AppInitialPage> createState() => _AppInitialPageState();
}

class _AppInitialPageState extends State<AppInitialPage> {
  TextEditingController not1 = TextEditingController();
  TextEditingController not2 = TextEditingController();
  TextEditingController not3 = TextEditingController();
  List<String> notuTextAl(List<TextEditingController> controllers) {
    List<String> notes = [];
    for (TextEditingController note in controllers) {
      notes.add(note.text);
    }
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Logo
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white70,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Image(
                      image: AssetImage(
                          'images/IM Maarif Okul Öncesi TR Logo.png'),
                    ),
                  ),
                ),
              ),
            ),
            // Welcome text
            Expanded(
              flex: 0,
              child: Text(
                'Welcome!',
                style: TextStyle(
                  backgroundColor: Colors.white70,
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            // Photo holder
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                    child: Image(
                  image: AssetImage('images/image2.png'),
                )),
              ),
            ),
            // App description
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'You can track your children\'s development on a daily, weekly, monthly, and yearly basis with Maarif e-preschool.',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Continue button
            Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.blue,
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 110, vertical: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  ApiCall apiCall = ApiCall();
                  // WeatherData? weatherData = await apiCall.getWeather();
                  // print(weatherData?.currentWeather.isDay);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
