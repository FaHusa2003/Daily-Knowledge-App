import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < -8) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        child: Container(
          width: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              const Spacer(),

              const Icon(
                Icons.lightbulb_outline,
                size: 80,
                color: Colors.white,
              ),

              const SizedBox(height: 20),

              const Text(
                "مرحباً بك في\nالمعلومة اليومية",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Icon(
                  Icons.keyboard_arrow_up,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
