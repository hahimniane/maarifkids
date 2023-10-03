import 'package:flutter/material.dart';
import 'package:maarifkids/utils/contants.dart';

import '../../menu_page.dart';
import '../../services/function_for_initializing_dates.dart';
import '../../utils/custom_delete_functionality.dart';
import '../../utils/custom_horizontal_activity_dates.dart';
import '../../utils/custom_nav_bar.dart';

class AdminViewOldFoolListPage extends StatefulWidget {
  const AdminViewOldFoolListPage({super.key});

  @override
  State<AdminViewOldFoolListPage> createState() =>
      _AdminViewOldFoolListPageState();
}

class _AdminViewOldFoolListPageState extends State<AdminViewOldFoolListPage> {
  List<DateTime> dates = [];
  List<Widget> activities = [];

  DateTime? selectedDate;

  int currentIndex = 0;

  bool showSearchBar = false;

  bool bottomModalIsActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: foodListString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: CustomActivityList(
              dates: dates,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              showSearchBar: showSearchBar,
              selectedDate: selectedDate!,
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: activities[dates.indexOf(selectedDate!)],
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
    selectedDate = initializeDates(
        dates: dates,
        activities: activities,
        whatToReturnAsAWidget: FoodListEditPage());
  }
}

class FoodListEditPage extends StatefulWidget {
  const FoodListEditPage({
    super.key,
  });

  @override
  State<FoodListEditPage> createState() => _FoodListEditPageState();
}

class _FoodListEditPageState extends State<FoodListEditPage> {
  bool editIconStatus = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: adminAppColor, borderRadius: BorderRadius.circular(10)),
            child: Material(
              color: adminAppColor,
              child: Text(
                'Breakfast',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 40),
                  decoration:
                      BoxDecoration(border: Border.all(color: adminAppColor)),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return TextField(
                        enabled: editIconStatus,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: breakFastFoods[index],
                          hintStyle: TextStyle(color: adminAppColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    adminAppColor), // Set the underline color to blue
                          ),
                        ),
                      );
                    },
                  ),

                  // width: MediaQuery.of(context).size.width * 0.70,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDeleteWidget(
                                title: "Delete Meal Entry",
                                content:
                                    'Are you sure you want to delete this Meal Entry?',
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          color: adminAppColor,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            editIconStatus = !editIconStatus;
                            print('the edit button status is $editIconStatus');
                          });
                        },
                        icon: Icon(
                          Icons.edit,
                          color: adminAppColor,
                        )),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: adminAppColor, borderRadius: BorderRadius.circular(10)),
            child: Material(
              color: adminAppColor,
              child: Text(
                'Lunch',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 40),
                  decoration:
                      BoxDecoration(border: Border.all(color: adminAppColor)),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return TextField(
                        enabled: editIconStatus,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: lunchFood[index],
                          hintStyle: TextStyle(color: adminAppColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    adminAppColor), // Set the underline color to blue
                          ),
                        ),
                      );
                    },
                  ),

                  // width: MediaQuery.of(context).size.width * 0.70,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDeleteWidget(
                                title: "Delete Meal Entry",
                                content:
                                    'Are you sure you want to delete this Medication Entry?',
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          color: adminAppColor,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            editIconStatus = !editIconStatus;
                            print('the edit button status is $editIconStatus');
                          });
                        },
                        icon: Icon(
                          Icons.edit,
                          color: adminAppColor,
                        )),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

List<String> breakFastFoods = [
  'Eggs',
  'Nuts',
  'Honey',
  'Milk',
  'Cheese',
];

List<String> lunchFood = [
  'Mercimek soup',
  'Kebab',
  'Chips',
  'Yogurt',
  'Apple',
];
