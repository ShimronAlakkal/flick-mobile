import 'package:flick/common/display_router.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MaterialApp(
      home: DisplayRouter(),
    ),
  );
}
