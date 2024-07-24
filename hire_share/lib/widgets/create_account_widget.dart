import 'package:flutter/material.dart';

import 'common_button_widget.dart';
import 'onboarding_app_bar.dart';

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({super.key});

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  String dropdownvalue = 'Create Account';
  final List<String> items = ['Create Account', 'Option 1', 'Option 2'];
  int dropdownvalueforphonenumber = 94;
  final List<int> itemslist = [1, 3, 4, 94, 95];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnBoardingAppBarWidget(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              child: Container(
                width: 240,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4), blurRadius: 1),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: const Border.fromBorderSide(
                        BorderSide(color: Colors.grey))),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  isExpanded: true,
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 30.0, 5.0),
                  iconSize: 30.0,
                  value: dropdownvalue,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  items: items.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Row(
                        children: [
                          Text(
                            "$item",
                            style: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 70.0,
            ),
            const Icon(Icons.smartphone, size: 100),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Enter your mobile number.We"ll \n text you a verification code.',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                width: 340,
                height: 90,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border:
                        Border.fromBorderSide(BorderSide(color: Colors.black))),
                child: Row(
                  children: [
                    SizedBox(
                      child: Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 2),
                          ],
                        ),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          isExpanded: true,
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 5.0, 5.0, 5.0),
                          iconSize: 30.0,
                          value: dropdownvalueforphonenumber,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                          ),
                          items:
                              itemslist.map<DropdownMenuItem<int>>((int? item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Row(
                                children: [
                                  Text(
                                    "+" + item.toString(),
                                    style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              dropdownvalueforphonenumber = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 190.0,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIconColor: Colors.black,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                                color: Color(0xFF454545), fontSize: 18),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25.00, vertical: 10.0)),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Center(
              child: Text('E.g. : 771324711',
                  style: TextStyle(
                      color: Color(0xFF454545),
                      fontStyle: FontStyle.normal,
                      fontSize: 13,
                      fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 40.0,
            ),
            CommonButtonWidget(
                backgroundColor: Colors.grey.shade500,
                text: 'NEXT',
                textColor: Colors.white,
                borderRadius: 5,
                width: 270,
                height: 60,
                fontSize: 16,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
