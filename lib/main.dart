import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/screens/navigation_screen/tabs/news_tab/categeries_tab/categeries_screen.dart';
import 'package:news_app/ui/utilitis/app_theme.dart';
import 'package:news_app/ui/utilitis/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'data/repository/data_sources/local_data_source/news_local_data_source.dart';
import 'di/depedency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  initDependencies(); // Initialize dependency injection
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: CategeriesScreen(),
    );
  }
}