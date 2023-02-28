import 'package:flutter/material.dart';

class CustomSnackBar {
  customSnackBar(BuildContext context, String content) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.up,
        duration: const Duration(seconds: 3),
        showCloseIcon: true,
      ),
    );
  }
}
