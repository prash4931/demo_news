import 'package:demo_news/screens/auth/login_screen.dart';
import 'package:demo_news/services/all_provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: allproviderList(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'News Demo',
      home: LoginScreen(),
    );
  }
}
