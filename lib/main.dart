import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/config/theme/app_themes.dart';
import 'package:flutter_clean_arch/features/home/presentation/pages/home/daily_news_page.dart';
import 'package:flutter_clean_arch/injection_container.dart';

import 'config/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CleanArch Sample',
      theme: theme(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      debugShowCheckedModeBanner: false,
      home: const DailyNewsPage(),
    );
  }
}
