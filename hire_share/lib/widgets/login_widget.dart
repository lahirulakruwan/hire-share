import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hire_share/widgets/back_button.dart';
import 'package:hire_share/widgets/common_button_widget.dart';

import 'Logo_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String _help = 'HELP';
  int dropdownvalue = 94;
  final List<int> items = [1, 3, 4, 94, 95];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.yellow[700],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: LogoWidget(),
                ),
                const Positioned(
                    left: 10.0,
                    top: 40.0,
                    child:BackButtonWidget()
                ),
                Positioned(
                    right: 10.0,
                    top: 40.0,
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.help,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            Text(
                              _help,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.elliptical(50, 50),
                              right: Radius.elliptical(50, 50)),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    )),
              ],
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
                      Container(
                        margin: const EdgeInsets.only(left: 70.0, top: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              width: 80.0,
                            ),
                            Container(
                              width: 140,
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
                                padding: const EdgeInsets.fromLTRB(
                                    60.0, 5.0, 16.0, 5.0),
                                iconSize: 30.0,
                                value: dropdownvalue,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                ),
                                items: items
                                    .map<DropdownMenuItem<int>>((int? item) {
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
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 15.0),
                        width: 270,
                        height: 75,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.fromBorderSide(
                                BorderSide(color: Colors.black))),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding:
                                    EdgeInsets.only(left: 5.0, right: 13.0),
                                child: Icon(
                                  Icons.account_box_rounded,
                                  size: 35.0,
                                ),
                              ),
                              prefixIconColor: Colors.black,
                              hintText: "Phone/Driver ID",
                              hintStyle: TextStyle(
                                  color: Color(0xFF454545), fontSize: 18),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0)),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: RichText(
                            text: const TextSpan(
                                text:
                                    'By proceeding,you are agreeing to our \n',
                                style: TextStyle(
                                    color: Color(0xFF454545),
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                                children: [
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(
                                  color: Colors.yellow, // Link color
                                  decoration:
                                      TextDecoration.underline, // Underline
                                ),
                              )
                            ])),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonButtonWidget(
                          backgroundColor: Colors.grey.shade500,
                          text: 'CONTINUE',
                          textColor: Colors.white,
                          borderRadius: 5,
                          width: 270,
                          height: 60,
                          fontSize: 16,
                          onPressed: () {}),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 75.0),
                            width: 120,
                            child: Divider(
                              color: Colors.grey.shade500,
                              thickness: 1,
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text(
                                'or',
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 75.0),
                              width: 120,
                              child: Divider(
                                color: Colors.grey.shade500,
                                thickness: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonButtonWidget(
                          backgroundColor: const Color(0xFFFFFFFF),
                          text: 'REGISTER',
                          textColor: Colors.black,
                          borderRadius: 5,
                          width: 270,
                          height: 60,
                          fontSize: 16,
                          borderColor: Colors.grey.shade500,
                          onPressed: () {}),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
