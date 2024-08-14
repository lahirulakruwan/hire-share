import 'package:flutter/material.dart';
import 'package:hire_share/widgets/final_step_widget.dart';

class FinalStepScreen extends StatefulWidget {
  const FinalStepScreen({super.key});

  @override
  State<FinalStepScreen> createState() => _FinalStepScreenState();
}

class _FinalStepScreenState extends State<FinalStepScreen> {
  @override
  Widget build(BuildContext context) {
    return const FinalStepWidget(
      name: 'Yujith',
    );
  }
}
