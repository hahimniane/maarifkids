import 'package:flutter/material.dart';

import 'package:maarifkids/utils/contants.dart';

import '../../menu_page.dart';
import '../../services/acitvities_class.dart';
import '../../services/function_for_initializing_dates.dart';
import 'saglik_page.dart';
import '../../../utils/custom_nav_bar.dart';

class DrugInformationPage extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  final bool isFromSearch;
  const DrugInformationPage(
      {super.key, required this.onDateSelected, required this.isFromSearch});

  @override
  State<DrugInformationPage> createState() => _DrugInformationPageState();
}

class _DrugInformationPageState extends State<DrugInformationPage> {
  List<DateTime> dates = [];
  // List<Widget> activities = [];
  List<Widget> myDeneme = [];

  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Health',
        context: context,
        isFromSearch: widget.isFromSearch,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileCard(),
          Expanded(
            child: CustomActivityList(
              addDividerAtTheBottom: false,
              showDateOnTop: false,
              dates: dates,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              showSearchBar: false,
              selectedDate: selectedDate!,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: myDeneme[dates.indexOf(selectedDate!)],
            ),
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

  @override
  void initState() {
    super.initState();
    List<Widget> newList;
    // DateTime selectedDate;
    selectedDate = initializeDates(
        dates: dates, activities: myDeneme, whatToReturnAsAWidget: ToDelete());
    // this.selectedDate = selectedDate;
    // this.myDeneme = newList;
  }
}

class ToDelete extends StatelessWidget {
  const ToDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
          child: Container(
            // height: 100,
            width: 20,
            child: Card(
              color: profileSecimiBackgroundColor,
              child: Center(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Drug Name:',
                          style: TextStyle(
                              fontSize: 16,
                              color: parentAppColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: parentAppColor),
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'Vitamin',
                          style: TextStyle(color: parentAppColor, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  CustomTimeWidget(
                    numberOfItems: 4,
                  ),
                  situationStatus(status: index == 0 ? true : false),
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}

class CustomTimeWidget extends StatelessWidget {
  final int numberOfItems;

  CustomTimeWidget({Key? key, required this.numberOfItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: numberOfItems,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20, // Adjust the width to change the oval shape
                  height: 10, // Adjust the height to change the oval shape
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the value to change the oval shape
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    hoursInLongFormat[index],
                    style: TextStyle(
                      fontSize: 14,
                      color: parentAppColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

List<String> hoursInLongFormat = [
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
  '19:00',
  '20:00',
  '21:00',
  '22:00',
  '23:00',
];

class situationStatus extends StatelessWidget {
  final bool status;
  const situationStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Situation:',
            style: TextStyle(
                color: parentAppColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          // Icon(
          //   Icons.check,
          //   color: MainColor,
          // ),
          status
              ? Image.asset(
                  'images/icons/checkIcon.png',
                  width: 30,
                  height: 30,
                )
              : Image.asset(
                  'images/icons/notAvailableIcon.png',
                  width: 30,
                  height: 30,
                ),
        ],
      ),
    );
  }
}
