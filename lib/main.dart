import 'package:firebase_core/firebase_core.dart';
import 'package:flick/common/display_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DisplayRouter(),
    ),
  );
}
