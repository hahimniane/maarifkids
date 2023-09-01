import 'package:flutter/material.dart';
import 'package:maarifkids/admin_module/profile_selection.dart';

import '../contants.dart';

import 'Components/profil_secimi.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Logo
            Expanded(
              child: Container(
                color: Colors.white70,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Image(
                        image: AssetImage(
                            'images/IM Maarif Okul Öncesi TR Logo.png')),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Email',
                      style: TextStyle(color: parentAppColor),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      // style: const TextStyle(color: Colors.grey),
                      controller: textField1Controller,
                      decoration: const InputDecoration(
                        hintText: 'isim@example.com',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Password',
                      style: TextStyle(color: parentAppColor),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      // style: const TextStyle(color: Colors.grey),
                      controller: textField1Controller,
                      decoration: const InputDecoration(
                        hintText: '********',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 100),
            // Welcome text
            Container(
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: parentAppColor,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ProfileSelectionPage()));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminProfileSelectionPage()));
                  },
                  child: const Text(
                    'Giriş!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
