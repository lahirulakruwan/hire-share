import 'package:flutter/material.dart';
import 'package:hire_share/widgets/onboarding_app_bar.dart';

import 'common_button_widget.dart';
import 'onboarding_progress_bar_widget.dart';

class ReferralCodeWidget extends StatefulWidget {
  const ReferralCodeWidget({super.key});

  @override
  State<ReferralCodeWidget> createState() => _ReferralCodeWidgetState();
}

class _ReferralCodeWidgetState extends State<ReferralCodeWidget> {
  final _referral_code_controller = TextEditingController();

  @override
  void dispose() {
    _referral_code_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnBoardingAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OnBoardingProgressBarWidget(
              fill_percentage: 0.43,
              text: "38% complete",
            ),
            const SizedBox(
              height: 40.0,
            ),
            Center(
                child: SizedBox(
                    width: 400,
                    height: 145,
                    child: Card(
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 15.0, right: 20.0),
                            child: RichText(
                                text: const TextSpan(
                                    text:
                                        'If you were referred by someone to join HireShare, enter their',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                    children: [
                                  TextSpan(
                                      text: ' referral code',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  TextSpan(
                                      text: ' here or select from below.',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300))
                                ])),
                          ),
                          const SizedBox(
                            height: 1.00,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 15.0, right: 20.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 180,
                                  height: 55,
                                  child: TextFormField(
                                    maxLength: 20,
                                    keyboardType: TextInputType.name,
                                    controller: _referral_code_controller,
                                    decoration: InputDecoration(
                                        counterText: '',
                                        filled: true,
                                        fillColor: Colors.white,
                                        label: const Text(
                                          'Enter code...',
                                          style: TextStyle(
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0)),
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Colors.black,
                                            size: 30.0,
                                          ),
                                          onPressed: () {
                                            _referral_code_controller.clear();
                                            setState(() {});
                                          },
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30.0,
                                ),
                                CommonButtonWidget(
                                    backgroundColor: Colors.grey.shade600,
                                    text: 'ADD',
                                    textColor: Colors.white,
                                    borderRadius: 5,
                                    width: 110,
                                    height: 45,
                                    fontSize: 16,
                                    onPressed: () {}),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))),
            const SizedBox(
              height: 40.0,
            ),
            Center(
              child: CommonButtonWidget(
                  backgroundColor: const Color(0xFFFFFFFF),
                  text: 'SKIP',
                  textColor: Colors.black,
                  borderRadius: 5,
                  width: 270,
                  height: 60,
                  fontSize: 16,
                  borderColor: Colors.grey.shade500,
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
