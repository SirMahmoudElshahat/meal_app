import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void setFilters(Map<Filter, bool> chodenFilters) {
    state = chodenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider.family<List<Meal>, String>((ref, categoryId) {
  final List<Meal> meals = ref.watch(mealsProvider);
  final Map<Filter, bool> filterSettings = ref.watch(filtersProvider);

  return meals.where((meal) => meal.categories.contains(categoryId)).where((meal) {
    if (filterSettings[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filterSettings[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filterSettings[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (filterSettings[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
