import 'package:flutter/material.dart';
import 'package:hire_share/document_summary.dart';
import 'package:hire_share/final_step.dart';
import 'package:hire_share/language.dart';
import 'package:hire_share/vehicle_details.dart';
import 'package:hire_share/vehicle_documents.dart';

import 'Login.dart';
import 'create_account.dart';
import 'documents.dart';
import 'driving_vehicle.dart';
import 'mobile_number_verification.dart';
import 'personal_document.dart';
import 'personal_info.dart';
import 'referral_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FinalStepScreen(),
    );
  }
}
