import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorities_provider.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
          children: ref.watch(favoritesMealsProvider).map(
                (meal) => MealItem(meal: meal),
              )
              .toList()),
    );
  }
}
