import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hire_share/widgets/common_button_widget.dart';
import 'package:hire_share/widgets/exapanded_tile_widget.dart';
import 'package:hire_share/widgets/onboarding_app_bar.dart';
import 'package:hire_share/widgets/onboarding_progress_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentSummaryWidget extends StatefulWidget {
  const DocumentSummaryWidget({super.key});

  @override
  State<DocumentSummaryWidget> createState() => _DocumentSummaryWidgetState();
}

class _DocumentSummaryWidgetState extends State<DocumentSummaryWidget> {
  bool _isPersonalInformationExpanded = false;
  bool _isVehicleDetailsExpanded = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const OnBoardingAppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            OnBoardingProgressBarWidget(
                fill_percentage: 0.87, text: "88% complete"),
            const SizedBox(
              height: 40.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Document Summary',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 19,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Submission status for your \nprovided documents are as shown \nbelow.',
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 2.0,
                child: ExpansionTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  iconColor: Colors.black,
                  title: const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      'Personal Information',
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Icon(
                      _isPersonalInformationExpanded
                          ? Icons.expand_less
                          : Icons.expand_more,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isPersonalInformationExpanded = value;
                    });
                  },
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    const ExpandedTileWidget(title: 'Profile Photo'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    const ExpandedTileWidget(title: 'Driving License'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    const ExpandedTileWidget(title: 'National Identity Card')
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 2.0,
                child: ExpansionTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  iconColor: Colors.black,
                  title: const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text(
                      'Vehicle Details',
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Icon(
                      _isVehicleDetailsExpanded
                          ? Icons.expand_less
                          : Icons.expand_more,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                  onExpansionChanged: (value) {
                    setState(() {
                      _isVehicleDetailsExpanded = value;
                    });
                  },
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    const ExpandedTileWidget(title: 'Vehicle Revenue License'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    const ExpandedTileWidget(title: 'Vehicle Insurance'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    const ExpandedTileWidget(
                        title: 'Vehicle Registration Document'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    const ExpandedTileWidget(title: 'Vehicle Pictures'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: CommonButtonWidget(
                  backgroundColor: Colors.indigo.shade900,
                  text: 'CONTINUE',
                  textColor: Colors.white,
                  borderRadius: 5,
                  width: 270,
                  height: 60,
                  fontSize: 16,
                  onPressed: () {}),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: RichText(
                  text: TextSpan(
                      text: 'Having trouble completing?',
                      style: const TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      children: [
                    TextSpan(
                      text: 'Let us know',
                      style: const TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          const url = 'https://pub.dev/packages/intl/install';
                          final Uri uri = Uri.parse(url);
                          await launchUrl(uri);
                        },
                    )
                  ])),
            ),
            const SizedBox(
              height: 10.0,
            )
          ]),
        ),
      ),
    );
  }
}
