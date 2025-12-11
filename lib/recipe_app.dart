import 'package:flutter/material.dart';
import 'data/recipes.dart';
import 'models/recipe.dart';
import 'screens/recipes_screen.dart';
import 'screens/result_screen.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String currentScreen = "recipes-screen";

  // selectedRatings is initially filled with empty strings because the rating is not yet given.
  List<String> selectedRatings = List.filled(recipes.length, "");

  double get averageRating {
    int sum = 0;
    int count = 0;

    for (final rating in selectedRatings) {
      if (rating.isNotEmpty) {
        sum += emojiToValue[rating]!;
        count++;
      }
    }

    if (count == 0) {
      return 0;
    }

    return sum / count;
  }

  String topRecipeName() {
    int besttValue = -1;
    String besttName = "";

    for (int i = 0; i < recipes.length; i++) {
      if (selectedRatings[i].isNotEmpty) {
        int value = emojiToValue[selectedRatings[i]]!;
        if (value > besttValue) {
          besttValue = value;
          besttName = recipes[i].recipeName;
        }
      }
    }
    return besttName;
  }

  void _restart() {
    setState(() {
      selectedRatings = List.filled(recipes.length, "");
      currentScreen = "recipes-screen";
    });
  }

  void _submit() {
    setState(() {
      currentScreen = "result-screen";
    });
  }

  void _selectRating(int index, String rating) {
    setState(() {
      selectedRatings[index] = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;

    if (currentScreen == "recipes-screen") {
      screenWidget = RecipesScreen(
        onSelectRating: _selectRating,
        onSubmit: _submit,
      );
    } else {
      screenWidget = ResultScreen(
        averageRating: averageRating,
        topRecipeName: topRecipeName(),
        onRestart: _restart,
      );
    }

    return Scaffold(
      body: screenWidget,
      backgroundColor: const Color.fromARGB(255, 73, 168, 122),
    );
  }
}
