import 'package:demo_news/screens/auth/login_screen.dart';
import 'package:demo_news/services/all_provider_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MultiProvider(providers: allproviderList(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My News',
      initialRoute: Routes.login,
      home: LoginScreen(),
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
