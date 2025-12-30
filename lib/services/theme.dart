import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const String _themeKey = 'isDarkMode';

  // Get current theme
  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  // Toggle theme
  Future<ThemeMode> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final currentIsDark = prefs.getBool(_themeKey) ?? false;
    final newIsDark = !currentIsDark;
    await prefs.setBool(_themeKey, newIsDark);
    return newIsDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }
}

