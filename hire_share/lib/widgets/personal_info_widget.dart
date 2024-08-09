import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hire_share/widgets/onboarding_app_bar.dart';
import 'package:hire_share/widgets/onboarding_progress_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_button_widget.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({super.key});

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  final _first_name_controller = TextEditingController();
  final _last_name_controller = TextEditingController();
  final _date_of_birth_controller = TextEditingController();
  final _nic_controller = TextEditingController();
  final _secondary_mobile_number_controller = TextEditingController();
  final _email_address_controller = TextEditingController();
  final _adddress_line_1_controller = TextEditingController();
  final _adddress_line_2_controller = TextEditingController();

  String genderValue = 'Male';
  final List<String> items = ['Male', 'Female'];
  String cityValue = 'Malabe';
  final List<String> cityItems = ['Kurunelgala', 'Malabe', 'Gampaha'];
  String? _vehicleOwnership;

  @override
  void dispose() {
    _first_name_controller.dispose();
    _last_name_controller.dispose();
    _date_of_birth_controller.dispose();
    _nic_controller.dispose();
    _secondary_mobile_number_controller.dispose();
    _email_address_controller.dispose();
    _adddress_line_1_controller.dispose();
    _adddress_line_2_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnBoardingAppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnBoardingProgressBarWidget(
                fill_percentage: 0.25,
                text: "25% complete",
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Peronal Information',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  '*Required',
                  style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Center(
                  child: Image.asset(
                'assets/images/man.png',
                width: 130.00,
                height: 130.00,
              )),
              const SizedBox(
                height: 40.0,
              ),
              Center(
                child: SizedBox(
                  width: 380,
                  height: 430,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 25.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'About you',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 160,
                                height: 70,
                                child: TextFormField(
                                  maxLength: 20,
                                  keyboardType: TextInputType.name,
                                  controller: _first_name_controller,
                                  decoration: InputDecoration(
                                      counterText: '',
                                      label: RichText(
                                          text: const TextSpan(
                                              text: 'First Name',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                              children: [
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    color: Colors.red))
                                          ])),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0))),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 160,
                                height: 70,
                                child: TextFormField(
                                  maxLength: 20,
                                  keyboardType: TextInputType.name,
                                  controller: _last_name_controller,
                                  decoration: InputDecoration(
                                      counterText: '',
                                      label: RichText(
                                          text: const TextSpan(
                                              text: 'Last Name',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                              children: [
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    color: Colors.red))
                                          ])),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0))),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: TextFormField(
                              maxLength: 20,
                              keyboardType: TextInputType.datetime,
                              controller: _date_of_birth_controller,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    onPressed: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2300),
                                      );

                                      if (pickedDate != null) {
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                        setState(() {
                                          _date_of_birth_controller.text =
                                              formattedDate;
                                        });
                                      }
                                    },
                                  ),
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Date of Birth',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                          children: [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red))
                                      ])),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2300),
                                );

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    _date_of_birth_controller.text =
                                        formattedDate;
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Gender',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                          children: [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red))
                                      ])),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                              isExpanded: true,
                              iconSize: 30.0,
                              value: genderValue,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              items: items.map<DropdownMenuItem<String>>(
                                  (String? item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Row(
                                    children: [
                                      Text(
                                        item.toString(),
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
                                  genderValue = newValue!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.name,
                              controller: _nic_controller,
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'NIC Number',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                          children: [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red))
                                      ])),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 370,
                  height: 575,
                  child: Card(
                    margin: const EdgeInsets.only(top: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 25.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact Details',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              controller: _secondary_mobile_number_controller,
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: const Text('Secondary Mobile Number'),
                                  labelStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: TextFormField(
                              maxLength: 20,
                              keyboardType: TextInputType.emailAddress,
                              controller: _email_address_controller,
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: const Text('Email Address(optional)'),
                                  labelStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: TextFormField(
                              maxLength: 50,
                              keyboardType: TextInputType.name,
                              controller: _adddress_line_1_controller,
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Address line 1',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                          children: [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red))
                                      ])),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: TextFormField(
                              maxLength: 50,
                              keyboardType: TextInputType.name,
                              controller: _adddress_line_2_controller,
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Address line 2',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                          children: [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red))
                                      ])),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'City',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300),
                                          children: [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(color: Colors.red))
                                      ])),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(4.0))),
                              isExpanded: true,
                              iconSize: 30.0,
                              value: cityValue,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              items: cityItems.map<DropdownMenuItem<String>>(
                                  (String? item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Row(
                                    children: [
                                      Text(
                                        item.toString(),
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
                                  cityValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 370,
                  height: 250,
                  child: Card(
                    margin: const EdgeInsets.only(top: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 25.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Vehicle Ownership',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.scale(
                                      scale: 1.0,
                                      child: Radio<String>(
                                        value:
                                            'I am the owner of this vehicle I am about to register.',
                                        groupValue: _vehicleOwnership,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _vehicleOwnership = value;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 13.0),
                                      child: Text(
                                        'I am the owner of this vehicle I \nam about to register.',
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.0,
                                      child: Radio<String>(
                                        value:
                                            'I am not the owner of the vehicle.',
                                        groupValue: _vehicleOwnership,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _vehicleOwnership = value;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    const Text(
                                      'I am not the owner of the vehicle.',
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/circle.png',
                                  width: 35.00,
                                  height: 35.00,
                                  color: Colors.grey[600],
                                  filterQuality: FilterQuality.medium,
                                ),
                                const SizedBox(
                                  width: 5.00,
                                ),
                                Link(
                                  target: LinkTarget.blank,
                                  uri: Uri.parse('https://www.google.co.uk/'),
                                  builder: (context, followLink) =>
                                      GestureDetector(
                                    onTap: followLink,
                                    child: const Text(
                                        'See list of documents required',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.black,
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: CommonButtonWidget(
                    backgroundColor: Colors.grey.shade700,
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
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: RichText(
                    text:  TextSpan(
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
                              decoration: TextDecoration.underline ),
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
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
