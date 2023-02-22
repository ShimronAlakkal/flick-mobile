import 'package:flutter/material.dart';

class PageNavigation {
  void moveToPage(
      {required Widget page,
      required BuildContext context,
      required bool replacement}) {
    if (replacement) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return page;
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return page;
      }));
    }
  }
}
