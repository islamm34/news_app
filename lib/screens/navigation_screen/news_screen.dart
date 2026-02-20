import 'package:flutter/material.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/news_tabs.dart';
import 'package:provider/provider.dart';

import '../../model/app_category.dart';
import '../../ui/utilitis/app_colors.dart';
import '../../ui/utilitis/providers/theme_provider.dart';
import '../widget/app_drawer.dart';

class NewsScreen extends StatefulWidget {
 final AppCategory category;
  const NewsScreen({super.key, required this.category});

  @override
  State<NewsScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NewsScreen> {
  late ThemeProvider themeProvider ;
  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      drawer: AppDrawer(),
      body: NewsTab(widget.category),
    );
  }


}
