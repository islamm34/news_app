import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ui/utilitis/app_colors.dart';
import '../../ui/utilitis/providers/theme_provider.dart';
// استورد الـ Provider الخاص بك
// import '../../providers/theme_provider.dart';  // افترض أن اسم ملف الـ Provider هو theme_provider.dart

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      backgroundColor: AppColors.black,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: AppColors.white,
              child: const Center(
                child: Text(
                  'New News',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Theme",
                    style: TextStyle(color: AppColors.white),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<ThemeMode>(
                    value: themeProvider.themeMode,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    dropdownColor: AppColors.black,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: AppColors.white),
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text(
                          'Light',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text(
                          'Dark',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.changeTheme(value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}