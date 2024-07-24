import 'package:flutter/material.dart';
import 'package:hire_share/language.dart';

import 'Login.dart';
import 'create_account.dart';
import 'mobile_number_verification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MobileNumberVerificationScreen(),
    );
  }
}
