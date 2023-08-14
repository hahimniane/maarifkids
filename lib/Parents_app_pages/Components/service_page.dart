import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:maarifkids/Parents_app_pages/Components/saglik_page.dart';

import 'package:maarifkids/contants.dart';

import '../../test_page.dart';
import '../menu_page.dart';
import 'attendance_page.dart';
import 'custom_nav_bar.dart';

class ServicePage extends StatelessWidget {
  final bool  isFromSearch;
  const ServicePage({super.key, required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: buildAppBar(  title: 'School Service', context: context, isFromSearch: isFromSearch,),
      body: Column(
        children: [
          ProfileCard(),
          const SizedBox(
            height: 8,
          ),
          DatePickerWidget(),
          Expanded(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0,vertical: 8),
                child: Container(
                  width: double.infinity,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(110)
),
                  child: Card(
                    elevation: 0.5,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Going To School',style: TextStyle(
                            fontSize: 16,
                            color: MainColor,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:4.0,right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Did he get on the school bus?',style: TextStyle(
                                  fontSize: 16,
                                  color: MainColor,

                              ),),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(child: Image.asset('images/icons/checkIcon.png',height: 35,width: 35,))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:4.0,right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Did he go to school?',style: TextStyle(
                                fontSize: 16,
                                color: MainColor,

                              ),),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(child: Image.asset('images/icons/checkIcon.png',height: 35,width: 35,))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Returning Home',style: TextStyle(
                              fontSize: 16,
                              color: MainColor,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:4.0,right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText('Did he get on the school bus?',style: TextStyle(
                                fontSize: 16,
                                color: MainColor,

                              ),),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(child: Image.asset('images/icons/notAvailableIcon.png',height: 35,width: 35,))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:4.0,right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Has he been handed over to the parent?',style: TextStyle(
                               fontSize: 12,
                                color: MainColor,

                              ),),
                              const Expanded(
                                child: SizedBox(
                                  width: 02,
                                ),
                              ),
                              Image.asset('images/icons/notAvailableIcon.png',height: 35,width: 35,)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: ' Missed: ',
                                    style: TextStyle(
                                        color: MainColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: '4',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MainColor,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          }
          else if (value == 1) {

            Navigator.push(context,      MaterialPageRoute(builder: (context) => SearchFieldSample()));
          }
        },
      ),
    );
  }
}
