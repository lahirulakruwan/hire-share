import 'package:flutter/material.dart';
import 'package:hire_share/widgets/common_button_widget.dart';
import 'package:hire_share/widgets/onboarding_app_bar.dart';

class DocumentWidget extends StatelessWidget {
  const DocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnBoardingAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Documents required for vehicle \nregistration',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 19,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'Mandatory documents,',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.normal,
                  fontSize: 19,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          'Revenue Licence',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          'Driving Licence',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          'Insurance Certificate(any insurance \ncategory)',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          'Vehicle photos (front / rear / inside)',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                   const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          "Driver's photo",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Non-mandatory documents,',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.normal,
                  fontSize: 19,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          'National Identity card',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(
                          'No Objection Certificate from the vehicle owner',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          'National Identity Card of the vehicle owner',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0, top: 4.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Expanded(
                        child: Text(
                          'Billing Proof',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Center(
              child: CommonButtonWidget(
                  backgroundColor: Colors.indigo.shade900,
                  text: 'OKAY',
                  textColor: Colors.white,
                  borderRadius: 5,
                  width: 270,
                  height: 60,
                  fontSize: 16,
                  onPressed: () {}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
