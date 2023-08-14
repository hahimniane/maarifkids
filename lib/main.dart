import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'Parents_app_pages/app_initial_page.dart';
import 'admin_app_pages/constants.dart';
import 'contants.dart';
import 'firebase_options.dart';

Future<void> main() async {
   WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(  DevicePreview(
    enabled: kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // primarySwatch: MainColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: MainColor,
            // primary: adminAppColor
          ),
          useMaterial3: true,
        ),
        home: const AppInitialPage());
  }
}
