// Kenil Ribadiya - Premium Flutter Web Portfolio
// Modern design with dark/light theme and advanced animations

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MyProtfoliio/my_portfolio.dart';

void main() {
  runApp(KenilPortfolioApp());
}

class KenilPortfolioApp extends StatefulWidget {
  const KenilPortfolioApp({Key? key}) : super(key: key);

  @override
  State<KenilPortfolioApp> createState() => _KenilPortfolioAppState();
}

class _KenilPortfolioAppState extends State<KenilPortfolioApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kenil Ribadiya — Flutter Developer',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      routes: {
        // '/': (context) => SimpleScrollRevealDemo(),
        '/': (context) => HomePage(onThemeToggle: toggleTheme),
        // '/projects': (context) => SimpleScrollRevealDemo(),
      },
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF1A1A1A),
      scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      textTheme: GoogleFonts.interTextTheme(),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF1A1A1A),
        secondary: Color(0xFF4A90E2),
        surface: Colors.white,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFFE0E0E0),
      scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFE0E0E0),
        secondary: Color(0xFF4A90E2),
        surface: Color(0xFF1A1A1A),
      ),
    );
  }
}
