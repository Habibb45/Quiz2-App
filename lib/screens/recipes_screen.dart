import 'package:flutter/material.dart';
import '../widgets/recipe_item.dart';
import '../data/recipes.dart';

class RecipesScreen extends StatelessWidget {
  final void Function(int, String) onSelectRating;
  final Function() onSubmit;

  const RecipesScreen({
    super.key,
    required this.onSelectRating,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...recipes.asMap().entries.map((entry) {
              int index = entry.key;
              var recipe = entry.value;

              return RecipeItem(
                recipe: recipe,
                index: index,
                onSelectRating: onSelectRating,
              );
            }).toList(),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Submit Ratings"),
            ),
          ],
        ),
      ),
    );
  }
}
