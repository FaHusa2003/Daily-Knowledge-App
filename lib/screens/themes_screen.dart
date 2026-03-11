import 'package:flutter/material.dart';
import '../main.dart';

class ThemesScreen extends StatefulWidget {
  const ThemesScreen({super.key});

  @override
  State<ThemesScreen> createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  int selectedIndex = -1;

  final List<Color> themeColors = [
    Color(0xFF2C2F4A), // أزرق بنفسجي داكن هادئ
    Color(0xFF263A44), // أزرق رمادي داكن
    Color(0xFF2F3E46), // رمادي مزرق مريح
    Color(0xFF354F52), // أخضر مزرق داكن
    Color(0xFF3A5A5A), // تركواز غامق هادئ
    Color(0xFF2E4A62), // أزرق بترولي باهت
    Color(0xFF3B3F5C), // بنفسجي رمادي هادئ
    Color(0xFF4A5568), // رمادي داكن أنيق
    Color(0xFF3D5A80), // أزرق هادئ غير ساطع
    Color(0xFF2F4858), // أزرق أخضر عميق
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الثيمات"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "اختر الثيم المفضل لديك",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                itemCount: themeColors.length,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),

                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      // تغيير لون التطبيق كامل
                      MyApp.of(context).changeTheme(themeColors[index]);

                      Navigator.pop(context);
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: themeColors[index],
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: selectedIndex == index
                          ? const Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40,
                              ),
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
