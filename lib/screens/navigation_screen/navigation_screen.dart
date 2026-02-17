import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_tabs.dart';
import 'package:provider/provider.dart';

import '../../ui/utilitis/app_colors.dart';
import '../../ui/utilitis/providers/theme_provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late ThemeProvider themeProvider ;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to News App')),
      drawer: buildDrawer(),
      body: NewsTabs(),
    );
  }

  buildDrawer() => Drawer(
    backgroundColor: AppColors.black,
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: AppColors.white,
            child: Center(
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
          SizedBox(height: 10),
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
                SizedBox(height: 10),
                DropdownButton<ThemeMode>(
                  value: themeProvider.themeMode,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  dropdownColor: AppColors.black,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down, color: AppColors.white),
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(
                        'Light',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(
                        'Dark',
                        style: TextStyle(color: AppColors.white),
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
