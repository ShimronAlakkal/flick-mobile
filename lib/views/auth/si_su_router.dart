import 'package:flick/common/tools/navigation_tool.dart';
import 'package:flick/constants/color_palette.dart';
import 'package:flick/views/auth/sign_in_page.dart';
import 'package:flick/views/auth/sign_up_page.dart';
import 'package:flick/views/home_page.dart';
import 'package:flutter/material.dart';

class SISURouter extends StatefulWidget {
  final bool isLoggedIn;
  const SISURouter({super.key, required this.isLoggedIn});

  @override
  State<SISURouter> createState() => _SISURouterState();
}

class _SISURouterState extends State<SISURouter> {
  final PageNavigation _pageNavigationInstance = PageNavigation();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return widget.isLoggedIn
        ? const Home()
        : Scaffold(
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
                      child: Image.asset('assets/illustrations/girl.png'),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.035 / 2,
                  ),

                  // The small desription on what to do next
                  Text(
                    "Hey! Welcome or welcome back.\n We're excited to have you here...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPalette().tertiaryTextColor,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(
                    height: height * 0.08,
                  ),

                  // Sign in button
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
                    // sign user in page
                    onPressed: () {
                      _pageNavigationInstance.moveToPage(
                          page: const SignInPage(),
                          context: context,
                          replacement: true);
                    },
                    child: const Text(
                      'Sign In',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.04,
                  ),

                  // register button
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
                    // sign user up page
                    onPressed: () {
                      _pageNavigationInstance.moveToPage(
                          page: const SignUpPage(),
                          context: context,
                          replacement: true);
                    },
                    child: const Text(
                      'Register',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.04,
                  ),

                  // divider
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.1, vertical: height * 0.025),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                              height: 1,
                              thickness: 1,
                              color: ColorPalette().tertiaryTextColor),
                        ),
                        Text(
                          '  or  ',
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorPalette().tertiaryTextColor),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            height: 1,
                            color: ColorPalette().tertiaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // the opther options row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Circular buttons to continue with apple
                      CircleAvatar(
                        backgroundColor: ColorPalette().primaryBlack,
                        radius: width * 0.08,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.apple_rounded,
                            size: width * 0.08,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      // Circular buttons with google
                      CircleAvatar(
                        backgroundColor: Colors.white30,
                        radius: width * 0.08,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/2991/2991148.png',
                            height: width * 0.1,
                            width: width * 0.1,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

// https://cdn-icons-png.flaticon.com/512/2991/2991148.png
                ],
              ),
            ),
          );
  }
}
