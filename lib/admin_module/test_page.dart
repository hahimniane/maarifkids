import 'package:flutter/material.dart';

class Meal {
  String type;
  List<String> foodItems;

  Meal({required this.type, required this.foodItems});
}

class MealPlanner extends StatefulWidget {
  @override
  _MealPlannerState createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  List<Meal> meals = [];

  String newMealType = 'Breakfast';
  String newFoodItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planner'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                DropdownButton<String>(
                  value: newMealType,
                  items: <String>['Breakfast', 'Lunch'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      newMealType = value!;
                    });
                  },
                ),
                SizedBox(width: 20),
                Expanded(
                  child: newMealType.isNotEmpty
                      ? TextField(
                          onChanged: (value) {
                            setState(() {
                              newFoodItem = value;
                            });
                          },
                          decoration: InputDecoration(labelText: 'Food Item'),
                        )
                      : Container(),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (newMealType.isNotEmpty && newFoodItem.isNotEmpty) {
                      setState(() {
                        meals.add(
                            Meal(type: newMealType, foodItems: [newFoodItem]));
                        newMealType = '';
                        newFoodItem = '';
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int index) {
                Meal meal = meals[index];
                return ListTile(
                  title: Text('Meal ${index + 1}: ${meal.type}'),
                  subtitle: Text(meal.foodItems.join(', ')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
