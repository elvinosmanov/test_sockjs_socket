import 'package:flutter/material.dart';
import 'package:test_sockjs_socket/components/custom_textfield.dart';
import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(R.botboxLogo).padding(top: 32, bottom: 78),
            Text(
              'Welcome Back',
              style: kBoldTextStyle(24),
            ),
            Text(
              'Please login to your account',
              style: kRegularTextStyle(14, kGreyColor),
            ).padding(top: 8, bottom: 32),
            CustomTextField(
              controller: TextEditingController(),
              label: "Email",
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: "Password",
              suffixIcon: GestureDetector(
                child: Image.asset(R.eyeOff).padding(all: 16),
              ),
            ).padding(top: 20),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Sign in',
                  style: kMediumTextStyle(16, kWhiteColor),
                ),
              ),
            ).padding(top: 20, bottom: 36),
            Center(
                child: Text(
              'Forgot password',
              style: kMediumTextStyle(16, kBlueColor),
            ))
          ],
        ),
      ),
    );
  }
}
