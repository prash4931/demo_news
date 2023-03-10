import 'package:demo_news/core/constants/color_constants.dart';
import 'package:demo_news/core/routes.dart';
import 'package:demo_news/screens/home/home_screen.dart';
import 'package:demo_news/widgets/common/common_textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();
  final GlobalKey<FormState> _logInformKey = GlobalKey<FormState>();

  // void signIn({required String emailAddress, required String password}) async {
  //   try {
  //     final credential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: emailAddress, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'MyNews',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorConstants().primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextFormField(
              labelHeading: 'Email',
              hintText: 'Enter Email',
              keyboardType: TextInputType.emailAddress,
              isEmailValidationRequired: true,
              controller: emailTEC,
            ),
            const SizedBox(
              height: 20,
            ),
            CommonTextFormField(
              labelHeading: 'Password',
              hintText: 'Enter Password',
              keyboardType: TextInputType.visiblePassword,
              controller: passwordTEC,
            )
          ],
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        ColorConstants().primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width * 0.6, 50))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ));
                },
                child: const Text('Login')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New here?'),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signUp);
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(color: ColorConstants().primaryColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
