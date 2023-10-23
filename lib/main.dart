import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maarifkids/Providers/Providers.dart';
import 'package:maarifkids/parent_module/app_initial_page.dart';
import 'package:maarifkids/theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider(),
          child: MyApp()), // Wrap your app
    ),
  );
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).activeThemeData,
        home: const AppInitialPage());
  }
}
