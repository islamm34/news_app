import 'package:flutter/material.dart';

import '../../ui/utilitis/app_colors.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to News App')),
      drawer: buildDrawer(),
    );
  }

  buildDrawer() => Drawer(
    backgroundColor: AppColors.black,
    child: Container(
      child: Column(
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
          Text("Theme", style: TextStyle(color: AppColors.white),textAlign: TextAlign.start),
          DropdownButton<ThemeMode>(
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            dropdownColor: AppColors.black,
            items: [
              DropdownMenuItem(
                child: Text('Light', style: TextStyle(color: AppColors.white)),
                value: ThemeMode.light,
              ),
              DropdownMenuItem(
                child: Text('Dark', style: TextStyle(color: AppColors.white)),
                value: ThemeMode.dark,
              ),
            ],
            onChanged: (value) {},
          ),
        ],
      ),
    ),
  );
}
