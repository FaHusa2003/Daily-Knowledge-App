import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الإعدادات"), centerTitle: true),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("تفعيل الإشعارات"),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text("إدارة المفضلة"),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text("مسح البيانات"),
          ),
          const ListTile(leading: Icon(Icons.info), title: Text("عن التطبيق")),
        ],
      ),
    );
  }
}
