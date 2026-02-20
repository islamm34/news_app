import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/app_category.dart';
import '../../screens/navigation_screen/news_screen.dart';
import '../../screens/navigation_screen/tabs/news_tab/categeries_tab/categeries_screen.dart';

abstract final class AppRoutes {
  static Route newsScreen(AppCategory category) =>
      MaterialPageRoute(builder: (_) => NewsScreen(category: category,));

  static Route get categoriesScreen  =>
      MaterialPageRoute(builder: (_) =>  CategeriesScreen());


}


