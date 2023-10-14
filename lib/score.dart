import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catch me"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "your score is $score",
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
