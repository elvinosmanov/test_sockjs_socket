import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_sockjs_socket/components/custom_textfield.dart';
import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';
import 'package:test_sockjs_socket/provider/login_provider.dart';
import 'package:test_sockjs_socket/screens/conversation/conversation_screen.dart';

import '../models/api_response.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  void _handleSubmitted() async {
    final apiResponse = await context
        .read<LoginProvider>()
        .loginUser(emailController.text, passwordController.text);
    if (apiResponse.apiError == null) {
      context.read<LoginProvider>().authToken = (apiResponse.data as ApiToken).data;
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ConversationScreen(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((apiResponse.apiError as ApiError).error ?? 'Error occured!')));
    }
  }

  String? isValidPassword(String value) {
    final passwordRegExp = RegExp(r'^((?!.*[\s])(?=.*\d).{5,15})');

    if (value.isEmpty) {
      return 'This field can\'t be empty';
    }
    return passwordRegExp.hasMatch(value) ? null : 'Password not valid';
  }

  String? isValidEmail(String value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return 'This field can\'t be empty';
    }
    return emailRegExp.hasMatch(value) ? null : 'Email not valid';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                R.botboxLogo,
                fit: BoxFit.scaleDown,
              ).padding(top: 32, bottom: 78),
              Text(
                'Welcome Back',
                style: kBoldTextStyle(24),
              ),
              Text(
                'Please login to your account',
                style: kRegularTextStyle(14, kGreyColor),
              ).padding(top: 8, bottom: 32),
              CustomTextField(
                contentPadding: const EdgeInsets.all(18),
                controller: emailController,
                helperText: 'Required',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  return isValidEmail(value!);
                },
                label: "Email",
              ),
              CustomTextField(
                controller: passwordController,
                label: "Password",
                helperText: 'Required',
                contentPadding: const EdgeInsets.all(16),
                obscureText: isObscure,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                validator: (String? value) {
                  return isValidPassword(value!);
                },
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: SvgPicture.asset(
                    !isObscure ? R.eyeOff : R.eyeOn,
                    fit: BoxFit.scaleDown,
                  ).padding(all: 16),
                ),
              ).padding(top: 20),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    bool isVal = loginFormKey.currentState!.validate();
                    if (isVal) {
                      _handleSubmitted();
                    }
                  },
                  child: context.watch<LoginProvider>().isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
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
      ),
    );
  }
}
