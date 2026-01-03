import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/theme.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const KhabarApp(),
    ),
  );
}

class KhabarApp extends StatelessWidget {
  const KhabarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khabar',
      theme: themeProvider.isDarkMode
          ? AppTheme.darkTheme
          : AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
