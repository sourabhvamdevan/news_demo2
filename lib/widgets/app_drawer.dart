import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  final Function(String) onCategorySelected;

  const AppDrawer({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Center(
              child: Text(
                "khabar",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
          ),
          drawerItem(context, "World", "general"),
          drawerItem(context, "Science", "science"),
          drawerItem(context, "Sport", "sports"),
          drawerItem(context, "Business", "business"),
          drawerItem(context, "Technology", "technology"),
          const Divider(),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget drawerItem(BuildContext context, String title, String cat) {
    return ListTile(
      title: Text(title),
      onTap: () {
        onCategorySelected(cat);
        Navigator.pop(context);
      },
    );
  }
}
