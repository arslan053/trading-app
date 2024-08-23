// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading/providers/setting_provider.dart';
import 'package:trading/routes.dart';
import 'constants/color_constants.dart';

void main() {
runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Risk Management App',
      theme: ThemeData(
        primarySwatch: ColorConstants.createMaterialColor(ColorConstants.primaryColor),
        primaryColor: ColorConstants.primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: ColorConstants.createMaterialColor(ColorConstants.primaryColor)).copyWith(
          secondary: ColorConstants.accentColor,
        ),
        scaffoldBackgroundColor: ColorConstants.backgroundColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: ColorConstants.textColor),
          bodyText2: TextStyle(color: ColorConstants.textColor),
        ),
      ),
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
