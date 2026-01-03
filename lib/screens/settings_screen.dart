import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeProvider.isDarkMode,
            onChanged: themeProvider.toggleTheme,
          ),
          const ListTile(
            title: Text("News Source"),
            subtitle: Text("NewsAPI.org"),
          ),
          const ListTile(title: Text("Country"), subtitle: Text("India")),
        ],
      ),
    );
  }
}
