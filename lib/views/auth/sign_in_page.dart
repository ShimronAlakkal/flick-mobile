import 'package:flick/common/top_lable_text_field.dart';
import 'package:flick/constants/color_palette.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TopLabelTextField topLabelTextFieldInstance = TopLabelTextField();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          // email field
          topLabelTextFieldInstance.topLabelTextField(
            controller: emailController,
            label: 'Email',
            hintText: '',
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            requiredField: true,
            maxLines: 1,
            borderRadius: 10,
            borderColor: ColorPalette().primaryBlack
          ),
        ],
      ),
    );
  }
}
