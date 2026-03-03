import 'package:flutter/material.dart';

class ThemesScreen extends StatefulWidget {
  const ThemesScreen({super.key});
  @override
  State<ThemesScreen> createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  int selectedIndex = 0;
  final List<Color> themeColors = [
    Color(0xFF5C6BC0),
    Color(0xFF42A5F5),
    Color(0xFF26A69A),
    Color(0xFF66BB6A),
    Color(0xFFFFA726),
    Color(0xFFEF5350),
    Color(0xFFAB47BC),
    Color(0xFF78909C),
    Color(0xFFFFCA28),
    Color(0xFF8D6E63),
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
              style: TextStyle(fontSize: 18),
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
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeColors[index],
                        borderRadius: BorderRadius.circular(20),
                        border: selectedIndex == index
                            ? Border.all(color: Colors.black, width: 3)
                            : null,
                      ),
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
