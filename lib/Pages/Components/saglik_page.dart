import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:maarifkids/Pages/Components/health_infromation_page.dart';
import 'package:maarifkids/contants.dart';
import 'package:maarifkids/widgets/navigator_class.dart';

import '../menu_page.dart';
import 'custom_nav_bar.dart';
import 'drug_information_page.dart';

class HealthWelcomePage extends StatelessWidget {
  final bool isFromSearch;
  const HealthWelcomePage({Key? key, required this.isFromSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: buildAppBar( title: 'Health', context: context, isFromSearch: isFromSearch,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfileCard(),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('hello');
              }
            },
            child: Center(
                child: SizedBox(
                    height: 100,
                    width: 270,
                    child: InkWell(
                      onTap: () {
                        NavigationHelper.pushPage(
                            context, const HealthInformationPage(isFromSearch: false,));
                      },
                      child: Card(
                        color: MainColor,
                        child: const Center(
                            child: Text(
                          'Health Information',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                      ),
                    ))),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              NavigationHelper.pushPage(
                  context,
                  DrugInformationPage(
                    onDateSelected: (DateTime) {}, isFromSearch: false,
                  ));
            },
            child: Center(
                child: SizedBox(
                    height: 100,
                    width: 270,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        'Drug Information',
                        style: TextStyle(
                            color: MainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )),
                    ))),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          }
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            elevation: 0.5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Profile Photo
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('images/yavuz_selim.jpeg'),
                      ),
                      const SizedBox(width: 10.0),

                      // Profile Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yavuz Selim CelikTas',
                              style: TextStyle(
                                color: MainColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Center(
                              child: Text(
                                '(Student)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: MainColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Height: ',
                                  style: TextStyle(
                                    color: MainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  '1.2 m',
                                  style: TextStyle(color: MainColor),
                                ),
                                Expanded(child: SizedBox(width: 16.0)),
                                Text(
                                  'Weight: ',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: MainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(

                                  '30 kg',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: MainColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      ' June 16, 2023',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: MainColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 3,
            thickness: 4,
            color: MainColor,
          )
        ],
      ),
    );
  }
}
