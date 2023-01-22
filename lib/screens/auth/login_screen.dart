import 'package:demo_news/screens/home/home_screen.dart';
import 'package:demo_news/widgets/common/common_textformfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'MyNews',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.indigo),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CommonTextFormField(
              labelHeading: 'Email',
              hintText: 'Enter Email',
              keyboardType: TextInputType.emailAddress,
              isEmailValidationRequired: true,
            ),
            SizedBox(
              height: 20,
            ),
            CommonTextFormField(
              labelHeading: 'Password',
              hintText: 'Enter Password',
              keyboardType: TextInputType.visiblePassword,
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
              TextButton(onPressed: () {}, child: const Text('Signup'))
            ],
          )
        ],
      ),
    );
  }
}
