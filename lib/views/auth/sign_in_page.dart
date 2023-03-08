// ignore_for_file: use_build_context_synchronously

import 'package:flick/common/tools/navigation_tool.dart';
import 'package:flick/common/tools/string_tools.dart';
import 'package:flick/common/widgets/custom_snackbar.dart';
import 'package:flick/constants/color_palette.dart';
import 'package:flick/common/widgets/top_lable_text_field.dart';
import 'package:flick/services/auth_services.dart';
import 'package:flick/services/forgot_password_service.dart';
import 'package:flick/views/auth/si_su_router.dart';
import 'package:flick/views/home_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TopLabelTextField topLabelTextFieldInstance = TopLabelTextField();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final PageNavigation _pageNavigationInstance = PageNavigation();

  final StringTools _stringTools = StringTools();
  final AuthServices _authServiceInstsance = AuthServices();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: ListView(
          children: [
            SizedBox(height: height * 0.04),

            // illustration
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                radius: width * 0.3,
                child: Image.asset('assets/illustrations/connect.png'),
              ),
            ),

            SizedBox(
              height: height * 0.035 / 2,
            ),

            // The small desription on what to do next
            Text(
              "Welcome back. You're almost there.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorPalette().tertiaryTextColor,
                fontSize: 14,
              ),
            ),

            SizedBox(
              height: height * 0.08,
            ),

            // email field
            topLabelTextFieldInstance.topLabelTextField(
              controller: emailController,
              label: 'Email',
              hintText: '',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              requiredField: true,
              maxLines: 1,
              borderRadius: 23,
              borderColor: ColorPalette().primaryBlack,
            ),

            SizedBox(
              height: height * 0.02,
            ),

            // password field
            topLabelTextFieldInstance.topLabelTextField(
              controller: passwordController,
              label: 'Password',
              hintText: '',
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              requiredField: true,
              maxLines: 1,
              borderRadius: 23,
              borderColor: ColorPalette().primaryBlack,
            ),

            const SizedBox(
              height: 10,
            ),

            // The reset password prompt
            InkWell(
              onTap: () {
                _stringTools.isValidEmail(email: emailController.text.trim())
                    ? _pageNavigationInstance.moveToPage(
                        page: ForgotPasswordPage(email: emailController.text),
                        context: context,
                        replacement: false)
                    : CustomSnackBar()
                        .customSnackBar(context, 'Please enter a valid email.');
              },
              child: Text(
                'Forgot Password? ',
                style: TextStyle(
                    color: ColorPalette().linkBlue,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),

            SizedBox(
              height: height * 0.06,
            ),

            // sign in Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette().primaryBlack,
                  side: BorderSide(
                    width: 1,
                    color: ColorPalette().inactiveIconGrey,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  padding: const EdgeInsets.all(12)),
              // sign user in
              onPressed: () async {
                if (isValidSignInForm()) {
                  setState(() {
                    _isLoading = !_isLoading;
                  });
                  var res = await _authServiceInstsance
                      .signUserInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text);

                  if (res == '1') {
                    setState(() {
                      _isLoading = !_isLoading;
                    });

                    _pageNavigationInstance.moveToPage(
                        page: const Home(),
                        context: context,
                        replacement: true);
                  } else {
                    setState(() {
                      _isLoading = !_isLoading;
                    });
                    CustomSnackBar().customSnackBar(context,
                        _stringTools.firebaseErrorHandler(res.toString()));
                  }
                } else {
                  CustomSnackBar()
                      .customSnackBar(context, 'Please edit the fields above.');
                }
              },
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'Sign In',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
            ),

            SizedBox(
              height: height * 0.06,
            ),

            // New to flick? sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'New to Flick? ',
                  style: TextStyle(
                      fontSize: 15, color: ColorPalette().tertiaryTextColor),
                ),
                InkWell(
                  // Go to sign up page
                  onTap: () {
                    _pageNavigationInstance.moveToPage(
                        page: const SISURouter(
                          isLoggedIn: false,
                        ),
                        context: context,
                        replacement: true);
                  },
                  child: Text(
                    'Sign Up',
                    style:
                        TextStyle(fontSize: 15, color: ColorPalette().linkBlue),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isValidSignInForm() {
    if (_stringTools.isValidPassword(password: passwordController.text) &&
        _stringTools.isValidEmail(email: emailController.text.trim())) {
      return true;
    }
    return false;
  }
}
