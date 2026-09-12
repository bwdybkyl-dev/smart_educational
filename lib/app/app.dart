import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'app_router.dart';
import 'app_routes.dart';

class SmartEducationalApp extends StatelessWidget {
  const SmartEducationalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'المستشار التعليمي الذكي',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      locale: const Locale('ar'),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
