import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maarifkids/Providers/Providers.dart';
import 'package:maarifkids/theme.dart';
import 'package:provider/provider.dart';

import 'Pages/app_initial_page.dart';
import 'contants.dart';
import 'enums.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => ChangeNotifierProvider(create: (BuildContext context)=>ThemeProvider(),
      child: MyApp()), // Wrap your app
    ),
  );
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key, });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
      theme:Provider.of<ThemeProvider>(context).activeThemeData,
        //userType==UserType.admin?AdminTheme.lightTheme():ParentTheme.lightTheme(),
        // theme: ThemeData(
        //   iconTheme: IconThemeData(
        //     color: Colors.white, // Set your desired icon color
        //   ),
        //   appBarTheme: AppBarTheme(
        //     iconTheme: IconThemeData(
        //       color: Colors
        //           .white, // Set your desired icon color for the back icon in AppBar
        //     ),
        //   ),
        //   colorScheme: ColorScheme.fromSeed(
        //     seedColor: parentAppColor,
        //   ),
        //   useMaterial3: true,
        // ),
        home: const AppInitialPage());
  }
}
