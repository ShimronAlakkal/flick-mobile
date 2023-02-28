// ignore_for_file: use_build_context_synchronously

import 'package:flick/common/tools/navigation_tool.dart';
import 'package:flick/common/tools/string_tools.dart';
import 'package:flick/common/widgets/custom_snackbar.dart';
import 'package:flick/common/widgets/top_lable_text_field.dart';
import 'package:flick/constants/color_palette.dart';
import 'package:flick/services/auth_services.dart';
import 'package:flick/views/auth/si_su_router.dart';
import 'package:flick/views/home/home_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            // illustration
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                radius: width * 0.33,
                child: Image.asset('assets/illustrations/bwbw.png'),
              ),
            ),

            // The small desription
            Text(
              "We're super excited to have you here!!\nSign up to play, enjoy, and have a wonderful time.",
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
              hintText: 'make it strong',
              keyboardType: TextInputType.visiblePassword,
              obscureText: false,
              requiredField: true,
              maxLines: 1,
              borderRadius: 23,
              borderColor: ColorPalette().primaryBlack,
            ),

            SizedBox(
              height: height * 0.06,
            ),

            // sign up Button
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
                  // sign user up
                  var res = await _authServiceInstsance
                      .signUserUpWithEmailAndPassword(
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
                      'Sign Up',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
            ),

            SizedBox(
              height: height * 0.06,
            ),

            // Nother options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Wanna choose another option?',
                  style: TextStyle(
                      fontSize: 15, color: ColorPalette().tertiaryTextColor),
                ),
                InkWell(
                  // Go to si_su_router
                  onTap: () {
                    _pageNavigationInstance.moveToPage(
                        page: const SISURouter(),
                        context: context,
                        replacement: true);
                  },
                  child: Text(
                    ' Click here',
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
