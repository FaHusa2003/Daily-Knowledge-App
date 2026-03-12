import 'package:flutter/material.dart';
import 'themes_screen.dart';
import 'topics_screen.dart';
import 'settings_screen.dart';
import '../data/dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int currentIndex = 0;
  // دوال الحفظ والتحميل
  Future<void> saveIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('fact_index', index);
  }

  Future<void> loadIndex() async {
    final prefs = await SharedPreferences.getInstance();
    currentIndex = prefs.getInt('fact_index') ?? 0;
    _pageController = PageController(initialPage: currentIndex);
    setState(() {});
  }

  /*@override
  void initState() {
    super.initState();
    _pageController = PageController();
  }*/
  // تعديل
  @override
  void initState() {
    super.initState();
    loadIndex();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void showSource(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: Text(dummyFacts[currentIndex].source));
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
        child: Column(
          children: [
            const SizedBox(height: 20),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical, // للتمرير راسي
                itemCount: dummyFacts.length,
                /* onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },*/
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                  saveIndex(index);
                },

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dummyFacts[index].fact,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        /*Text( // ما نحتاج نص المصدر تحت المعلومة 
                          dummyFacts[index].source,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),*/
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // أزرار التفاعل
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
                  icon: const Icon(Icons.share, color: Colors.white, size: 28),
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 15),

            // شريط التنقل السفلي
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
    );
  }
}
