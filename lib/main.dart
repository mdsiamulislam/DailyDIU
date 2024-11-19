import 'package:dailydiu/screen/auth/forget_screen.dart';
import 'package:dailydiu/screen/auth/login_screen.dart';
import 'package:dailydiu/screen/auth/reg_screen.dart';
import 'package:dailydiu/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyDiu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegScreen.id: (context) => const RegScreen(),
        ForgetScreen.id: (context) => const ForgetScreen(),
      },
    );
  }
}
