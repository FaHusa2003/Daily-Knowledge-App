/*import 'package:flutter/material.dart'; // نكتبه في مطلع كل ملف
//استدعاء ملف الدارت من مجلد فلاتر الموجود في السي
import 'screens/welcome_screen.dart'; // مختصر لاننا داخل نفس المشروع
//import 'package:daily_knowledge/screens/welcome_screen.dart'; وهذا صح

void main() {
  // ملف اساسي مافي اي شيء يشتغل بدونه
  runApp(const MyApp()); // عشان نشغل رن لازم نسوي كلاس
  // فونكشن محجوزة من قبل
}

class MyApp extends StatelessWidget {
  //StatelessWidget > اليوزر ما يتفاعل معه
  const MyApp({super.key});
  @override // لما نستدعي الكلاسات في أكثر من مكان نستخدمها للفصل بينهم
  Widget build(BuildContext context) {
    // build ميثود مشترك في كل ودجيت
    return const MaterialApp(
      //MaterialApp اساس مهم . تحدد المعلومات الأساسية والثابتة داخل الآبلكيشن
      debugShowCheckedModeBanner: false, // يروح الشريط الي في الركن
      home: WelcomeScreen(), // تفتح ملف اخر مباشرة
    );
  }
}*/
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color appColor = const Color(0xFF5C6BC0);

  void changeTheme(Color color) {
    setState(() {
      appColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: appColor,
        appBarTheme: AppBarTheme(
          backgroundColor: appColor,
          foregroundColor: Colors.white,
        ),
      ),

      home: const WelcomeScreen(),
    );
  }
}
