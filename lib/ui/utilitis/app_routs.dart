import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/navigation_screen/navigation_screen.dart';

abstract final class AppRouts {
  static Route get  navigationScreen => MaterialPageRoute(
    builder: (_) => NavigationScreen(),
  );
}


