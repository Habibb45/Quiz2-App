import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double averageRating;
  final String topRecipeName;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.averageRating,
    required this.topRecipeName,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Average Rating: ${averageRating.toStringAsFixed(1)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "Top Recipe: $topRecipeName",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: onRestart, child: const Text("Restart")),
          ],
        ),
      ),
    );
  }
}
