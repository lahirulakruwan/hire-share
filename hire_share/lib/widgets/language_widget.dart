import 'package:flutter/material.dart';
import 'package:hire_share/widgets/Logo_widget.dart';
import 'package:hire_share/widgets/rounded_language_container.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[700],
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: LogoWidget(),
            ),
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Please select your language',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RoundedLanguageContainer(language: 'සිංහල'),
                    const SizedBox(
                      height: 30,
                    ),
                    RoundedLanguageContainer(language: 'ENGLISH'),
                    const SizedBox(
                      height: 30,
                    ),
                    RoundedLanguageContainer(language: 'தமிழ்'),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child:Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse('https://www.google.co.uk/'),
                        builder: (context, followLink) => GestureDetector(
                          child:  Text('Or ride with Pickme',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                          onTap: followLink,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
