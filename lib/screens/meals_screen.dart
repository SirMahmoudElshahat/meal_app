import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final String title = args['title'];
    final List<Meal> meals =
        (args['meals'] as List<dynamic>).map((meal) => meal as Meal).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: meals
                .map(
                  (meal) => MealItem(meal: meal),
                )
                .toList()),
      ),
    );
  }
}
