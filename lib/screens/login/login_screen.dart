import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:test_sockjs_socket/components/custom_textfield.dart';
import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';
import 'package:test_sockjs_socket/provider/login_provider.dart';

import '../../models/api_response.dart';

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
  // ignore: unused_element
  void _handleSubmitted() async {
    final apiResponse = await context
        .read<LoginProvider>()
        .loginUser(emailController.text, passwordController.text);
    if (apiResponse.apiError == null) {
      // ignore: use_build_context_synchronously
      context.read<LoginProvider>().authToken = (apiResponse.data as ApiToken).data;
      // ignore: use_build_context_synchronously
      
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((apiResponse.apiError as ApiError).error ?? 'Error occured!')));
    }
  }

  bool isValidPassword(String value) {
    final passwordRegExp = RegExp(r'^((?!.*[\s])(?=.*\d).{5,15})');

    return passwordRegExp.hasMatch(value);
  }

  bool isValidEmail(String value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return emailRegExp.hasMatch(value);
  }

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _emailHasFocus = false;
  bool _passwordHasFocus = false;
  bool _emailHasError = false;
  bool _passwordHasError = false;
  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        _emailHasFocus = _emailFocusNode.hasFocus;
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        _passwordHasFocus = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
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
              Image.asset(R.chatdodoLogoImage).padding(top: 32, bottom: 84),
              Text(
                'Welcome Back',
                style: kBoldTextStyle(32),
              ),
              Text(
                'Please login to your account',
                style: kRegularTextStyle(16, kGreyColor),
              ).padding(bottom: 32),
              CustomTextField(
                controller: emailController,
                focusNode: _emailFocusNode,
                label: 'Email',
                hasFocus: _emailHasFocus,
                hasError: _emailHasError,
              ),
              Text(
                'Required',
                style: kRegularTextStyle(12, _emailHasError ? kRedColor : kGreyColor),
              ).padding(left: 12, top: 2),
              _buildEmailTextField().padding(top: 20),
              Text(
                'Required',
                style: kRegularTextStyle(12, _emailHasError ? kRedColor : kGreyColor),
              ).padding(left: 12, top: 2),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPurpleColor)),
                  onPressed: () {
                    bool isValEmail = isValidEmail(emailController.text);
                    bool isValPass = isValidPassword(passwordController.text);
                    if (isValEmail) {
                      _emailHasError = false;
                      // _handleSubmitted();
                    } else {
                      _emailHasError = true;
                    }
                    if (isValPass) {
                      _passwordHasError = false;
                      // _handleSubmitted();
                    } else {
                      _passwordHasError = true;
                    }

                    setState(() {});
                  },
                  child: context.watch<LoginProvider>().isLoading
                      ? const Center(
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
                style: kMediumTextStyle(16, kPurpleColor),
              ))
            ],
          ),
        ),
      ),
    );
  }

  CustomTextField _buildEmailTextField() {
    return CustomTextField(
      hasFocus: _passwordHasFocus,
      focusNode: _passwordFocusNode,
      controller: passwordController,
      hasError: _passwordHasError,
      label: "Password",
      obscureText: isObscure,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        child: SvgPicture.asset(
          !isObscure ? R.eyeOff : R.eyeOn,
          fit: BoxFit.scaleDown,
          color: kGreyColor,
        ).padding(all: 16),
      ),
    );
  }
}
