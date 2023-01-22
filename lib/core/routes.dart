import 'package:demo_news/screens/auth/login_screen.dart';
import 'package:demo_news/screens/auth/signup_screen.dart';
import 'package:demo_news/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const login = '/login';
  static const signUp = '/signup';

  static const homeScreen = '/home_screen';

  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    final name = settings.name;
    final arguments = settings.arguments;

    switch (name) {
      case homeScreen:
        return _buildPage(const HomeScreen());
      case login:
        return _buildPage(const LoginScreen());
      case signUp:
        return _buildPage(const SignUpScreen());
      default:
        return null;
    }
  }

  static MaterialPageRoute _buildPage(Widget page) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
    );
  }
}
