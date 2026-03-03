import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5C6BC0),
      body: Column(
        children: [
          const Spacer(),
          const Icon(Icons.lightbulb_outline, size: 80, color: Colors.white),
          const SizedBox(height: 20),
          const Text(
            "مرحباً بك في\nالمعلومة اليومية",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: const Icon(
              Icons.keyboard_arrow_up,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
