//تم تعديل ايقونة المصدر ووضع نص المصدر فيها وحذف الشريط السفلي
//ووضع الايقونات في دوائر شفافة وتغيير لون الخلفية
import 'package:flutter/material.dart';
import 'topics_screen.dart';
import 'themes_screen.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFFF8E1F4),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("المعلومة اليومية"),
        backgroundColor: const Color(0xFFF8E1F4),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            const Expanded(
              child: Center(
                child: Text(
                  "هل تعلم أن العسل لا يفسد أبداً؟",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // أيقونات التفاعل تحت المعلومة مباشرة بدون دوائر
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.star_border, size: 28),
                  onPressed: () {
                    // وظيفة المفضلة لاحقاً
                  },
                ),
                const SizedBox(width: 25),
                IconButton(
                  icon: const Icon(Icons.info_outline, size: 28),
                  onPressed: () {
                    showSource(context);
                  },
                ),
                const SizedBox(width: 25),
                IconButton(
                  icon: const Icon(Icons.share, size: 28),
                  onPressed: () {
                    // وظيفة المشاركة لاحقاً
                  },
                ),
              ],
            ),

            const SizedBox(height: 25),

            // أيقونات التنقل للشاشات الأخرى مع دوائر صغيرة زي ما كان
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black.withOpacity(0.1),
                  child: IconButton(
                    icon: const Icon(Icons.menu_book),
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
                  backgroundColor: Colors.black.withOpacity(0.1),
                  child: IconButton(
                    icon: const Icon(Icons.color_lens),
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
                  backgroundColor: Colors.black.withOpacity(0.1),
                  child: IconButton(
                    icon: const Icon(Icons.settings),
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
    );
  }
}
