import 'package:flutter/material.dart';
import 'package:maarifkids/admin_module/profile_selection.dart';
import 'package:provider/provider.dart';
import '../Providers/Providers.dart';
import '../admin_module/SchoolService/service_assistant/service_assistant_welcome_page.dart';
import '../services/navigator_class.dart';
import '../utils/enums.dart';
import 'profil_secimi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      // style: const TextStyle(color: Colors.grey),
                      controller: emailTextFieldController,
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
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      // style: const TextStyle(color: Colors.grey),
                      controller: passwordTextFieldController,
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
                  key: Key('loginButton'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    if (emailTextFieldController.text == 'parent') {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeUserType(UserType.parent);
                      NavigationHelper.pushPage(
                          context, ParentProfileSelectionPage());
                    } else if (emailTextFieldController.text == 'assistant') {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeUserType(UserType.admin);
                      NavigationHelper.pushPage(
                          context, ServiceAssistantWelcomePage());
                    } else {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeUserType(UserType.admin);
                      NavigationHelper.pushPage(
                          context, AdminProfileSelectionPage());
                    }
                  },
                  child: const Text(
                    'Login!',
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
