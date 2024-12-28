import 'package:flut_to_do/ui/home_page.dart';
import 'package:flut_to_do/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutToDo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF80D9F4)),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}
