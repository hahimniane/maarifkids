import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maarifkids/services/navigator_class.dart';
import 'package:maarifkids/utils/contants.dart';

import '../menu_page.dart';
import '../utils/custom_nav_bar.dart';
import '../utils/search_functionality.dart';

class MealPlanner extends StatefulWidget {
  @override
  _MealPlannerState createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  List<MealPlan> mealPlans = [];
  String selectedMealType = 'Breakfast';
  List<Meal> currentMealPlan = [];

  @override
  void initState() {
    super.initState();
    // currentMealPlan.add(Meal(item: ''));
  }

  void addMealItem() {
    setState(() {
      currentMealPlan.add(Meal(item: ''));
    });
  }

  // void createAnotherMeal() {
  //   setState(() {
  //     mealPlans.add(MealPlan(mealType: selectedMealType, meals: List.from(currentMealPlan)));
  //     selectedMealType = 'Breakfast';
  //   });
  // }

  void createAnotherMeal() {
    setState(() {
      // Add the "Choose Meal" material as the first item in the current meal plan
      currentMealPlan.insert(0, Meal(item: 'Choose Meal'));

      mealPlans.add(MealPlan(
          mealType: selectedMealType, meals: List.from(currentMealPlan)));
      selectedMealType = 'Breakfast';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: foodListString,
        context: context,
        isFromSearch: false,
        isAdminColor: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: adminAppColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: adminAppColor,
                        child: Text(
                          'Choose Meal',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      iconEnabledColor: adminAppColor,
                      isExpanded: true,
                      hint: Text("Select Meal Type"),
                      value: selectedMealType,
                      onChanged: (newValue) {
                        setState(() {
                          selectedMealType = newValue!;
                        });
                      },
                      items:
                          ["Breakfast", "Lunch"].map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              textAlign:TextAlign.center,
                              value,style: TextStyle(
                              color: adminAppColor
                            ),),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: List.generate(
                  currentMealPlan.length,
                  (index) => MealItemWidget(
                    meal: currentMealPlan[index],
                    onTextChanged: (text) {
                      setState(() {
                        currentMealPlan[index].item = text;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        currentMealPlan.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: adminAppColor,
                    ),
                    onPressed: addMealItem,
                  ),
                  Text('Add',style: TextStyle(
                    color: adminAppColor
                  ),)
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: mealPlans.map((mealPlan) {
                  return MealPlanWidget(
                    mealPlan: mealPlan,
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                  onTap: createAnotherMeal,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.no_meals,
                          color: adminAppColor,
                        ),
                        Text(
                          "Add Meal",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: adminAppColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                    onTap: createAnotherMeal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: adminAppColor,
                          borderRadius: BorderRadius.circular(8)),
                      width: 50,
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            NavigationHelper.pushPage(context, MenuPage());
          } else if (value == 1) {
            NavigationHelper.pushPage(context, SearchFieldSample());
          }
        },
      ),
    );
  }
}

class MealPlan {
  String mealType;
  List<Meal> meals;

  MealPlan({required this.mealType, required this.meals});
}

class Meal {
  String item;

  Meal({required this.item});
}

class MealItemWidget extends StatelessWidget {
  final Meal meal;
  final Function(String) onTextChanged;
  final VoidCallback onDelete;

  MealItemWidget({
    required this.meal,
    required this.onTextChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
                height: 50,
                child: TextFormField(
                  initialValue: meal.item,
                  onChanged: onTextChanged,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: adminAppColor
                    ),
                    labelText: "Meal Item",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: adminAppColor), // Set the border color to red
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: adminAppColor), // Set the border color to red
                    ),
                  ),
                )),
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.xmark,
              color: adminAppColor,
            ),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class MealPlanWidget extends StatefulWidget {
  final MealPlan mealPlan;

  MealPlanWidget({required this.mealPlan});

  @override
  _MealPlanWidgetState createState() => _MealPlanWidgetState();
}

class _MealPlanWidgetState extends State<MealPlanWidget> {
  // Initialize here
  List<Meal> currentMealPlan = [];
  String selectedMealType = 'Breakfast';

  void addMealItem() {
    setState(() {
      currentMealPlan.add(Meal(item: ''));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: adminAppColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Material(
                  color: adminAppColor,
                  child: Text(
                    'Choose Meal',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: DropdownButton<String>(
                iconEnabledColor: adminAppColor,
                isExpanded: true,
                hint: Text("Select Meal Type"),
                value: selectedMealType,
                onChanged: (newValue) {
                  setState(() {
                    selectedMealType = newValue!;
                  });
                },
                items: ["Breakfast", "Lunch"].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: adminAppColor),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: List.generate(
            currentMealPlan.length,
            (index) => MealItemWidget(
              meal: currentMealPlan[index],
              onTextChanged: (text) {
                setState(() {
                  currentMealPlan[index].item = text;
                });
              },
              onDelete: () {
                setState(() {
                  currentMealPlan.removeAt(index);
                });
              },
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: adminAppColor,
              ),
              onPressed: addMealItem,
            ),
            Text('Add',style: TextStyle(
                color: adminAppColor
            ),)
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    currentMealPlan.add(Meal(item: ''));
  }
}
