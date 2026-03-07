// تم تعديل السهم للسحب بلا الضغط عليه و تعديل النص إالى المنتصف
import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8E1F4), // خلفية زهري هادي زي الهوم
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < -8) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        child: Column(
          children: [
            // الجزء الأوسط
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 80,
                      color: Color(0xFF5C6BC0), // بنفسجي مثل أيقونات الهوم
                    ),

                    SizedBox(height: 20),

                    Text(
                      "مرحباً بك في\nالمعلومة اليومية",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5C6BC0), // بنفسجي مثل أيقونات الهوم
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // السهم تحت في المنتصف
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Icon(
                Icons.keyboard_arrow_up,
                size: 50,
                color: Color(0xFF5C6BC0), // بنفسجي مثل أيقونات الهوم
              ),
            ),
          ],
        ),
      ),
    );
  }
}
