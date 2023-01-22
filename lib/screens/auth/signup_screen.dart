import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../core/routes.dart';
import '../../widgets/common/common_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();
  final TextEditingController nameTEC = TextEditingController();
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
          children: [
            CommonTextFormField(
              labelHeading: 'Name',
              hintText: 'Enter Name',
              keyboardType: TextInputType.name,
              controller: nameTEC,
            ),
            const SizedBox(
              height: 20,
            ),
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
              textInputAction: TextInputAction.done,
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
                onPressed: () {},
                child: const Text('Signup')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: ColorConstants().primaryColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
