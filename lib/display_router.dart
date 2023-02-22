import 'package:flick/views/auth/sign_in_page.dart';
import 'package:flutter/material.dart';

class DisplayRouter extends StatefulWidget {
  const DisplayRouter({super.key});

  @override
  State<DisplayRouter> createState() => _DisplayRouterState();
}

class _DisplayRouterState extends State<DisplayRouter> {
  @override
  Widget build(BuildContext context) {
    return const SignInPage();
  }
}
