import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/user_settings_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/motor_details_screen.dart';
import 'screens/motor_issues_screen.dart';

void main() {
  runApp(const DMRInventoryApp());
}

class DMRInventoryApp extends StatelessWidget {
  const DMRInventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DMR Motor Inventory',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/user_settings': (context) => const UserSettingsScreen(),
        '/scan': (context) => const ScanScreen(),
        '/motor_details': (context) => const MotorDetailsScreen(),
        '/motor_issues': (context) => const MotorIssuesScreen(),
      },
    );
  }
}