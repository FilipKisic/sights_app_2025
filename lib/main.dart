import 'package:flutter/material.dart';
import 'package:sights_app/screen/sign_in_screen.dart';
import 'package:sights_app/style/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const SignInScreen(),
    );
  }
}


