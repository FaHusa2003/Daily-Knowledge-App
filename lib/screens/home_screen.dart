import 'package:flutter/material.dart';
import 'themes_screen.dart';
import 'topics_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showSource(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(content: Text("المصدر: National Geographic"));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(title: const Text("المعلومة اليومية"), centerTitle: true),

      body: Container(
        width: double.infinity,
        color: themeColor,

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const Expanded(
                child: Center(
                  child: Text(
                    "هل تعلم أن العسل لا يفسد أبداً؟",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.star_border,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),

                  const SizedBox(width: 25),

                  IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      showSource(context);
                    },
                  ),

                  const SizedBox(width: 25),

                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      icon: const Icon(Icons.menu_book, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopicsScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      icon: const Icon(Icons.color_lens, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThemesScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
