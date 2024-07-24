import 'package:flutter/material.dart';

import 'onboarding_app_bar.dart';
import 'onboarding_progress_bar_widget.dart';

class MobileNumberVerificationWidget extends StatefulWidget {
  const MobileNumberVerificationWidget({super.key});

  @override
  State<MobileNumberVerificationWidget> createState() => _MobileNumberVerificationWidgetState();
}

class _MobileNumberVerificationWidgetState extends State<MobileNumberVerificationWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: OnBoardingAppBarWidget(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            OnBoardingProgressBarWidget(fill_percentage: 0.1,)
          ],
        ),
      ),
    );
  }
}