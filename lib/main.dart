import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:quiz_assigment/providers/theme_provider.dart';
import 'package:quiz_assigment/screens/home_screen.dart';
import 'package:quiz_assigment/screens/splash_screen.dart';

final logger = Logger();



void main() {
 
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(appThemeProvider) ? ThemeMode.dark : ThemeMode.light,
      home: 
      // const HomeScreen(),
      AnimatedSplashScreen(
        duration: 5000,
        splash: SplashScreen(),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 300,
      ),
    );
  }
}
