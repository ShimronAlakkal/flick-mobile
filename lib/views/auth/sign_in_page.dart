import 'package:flick/common/tools/navigation_tool.dart';
import 'package:flick/constants/color_palette.dart';
import 'package:flick/common/widgets/top_lable_text_field.dart';
import 'package:flick/views/auth/si_su_router.dart';
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
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
              onPressed: () {},
              child: const Text(
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
                        page: const SISURouter(),
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
}
