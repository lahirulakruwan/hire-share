import 'package:flutter/material.dart';
import 'package:hire_share/widgets/four_digit_enter_widget.dart';

import 'onboarding_app_bar.dart';
import 'onboarding_progress_bar_widget.dart';

class MobileNumberVerificationWidget extends StatefulWidget {
  final String mobileNo;
  const MobileNumberVerificationWidget({
    required this.mobileNo
  });

  @override
  State<MobileNumberVerificationWidget> createState() => _MobileNumberVerificationWidgetState();
}

class _MobileNumberVerificationWidgetState extends State<MobileNumberVerificationWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: OnBoardingAppBarWidget(),
      body:Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              OnBoardingProgressBarWidget(fill_percentage: 0.05,text: 'Getting Started!'),
              const SizedBox(
                height: 20,
              ),
              const Icon(Icons.smartphone, size: 150),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Please enter the 4-digit \n code sent via SMS to \n ${widget.mobileNo.toString()}',
                  style:const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45.0),
                    child: FourDigitEnterWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: FourDigitEnterWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: FourDigitEnterWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: FourDigitEnterWidget(),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}