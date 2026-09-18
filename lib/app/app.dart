import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';
import '../core/constants/app_strings.dart';

class SmartParkingApp extends StatelessWidget {
  const SmartParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}