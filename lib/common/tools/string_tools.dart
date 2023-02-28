class StringTools {
  // valisd passcode checker
  bool isValidPassword({required String password}) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return RegExp(pattern).hasMatch(password);
  }

  // valid mail checker
  bool isValidEmail({required String email}) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  String firebaseErrorHandler(String error) {
    for (int i = 0; i < error.length; i++) {
      if (error[i] == ']') {
        return error.substring(i + 1, error.length);
      }
    }
    return error;
  }
}
