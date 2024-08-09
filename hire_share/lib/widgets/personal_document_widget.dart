import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_button_widget.dart';
import 'onboarding_app_bar.dart';
import 'onboarding_progress_bar_widget.dart';

class PersonalDocumentWidget extends StatefulWidget {
  const PersonalDocumentWidget({super.key});

  @override
  State<PersonalDocumentWidget> createState() => _PersonalDocumentWidgetState();
}

class _PersonalDocumentWidgetState extends State<PersonalDocumentWidget> {
  final _driving_licence_number_controller = TextEditingController();
  final _expiration_date_controller = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _profile_image;
  File? _driving_licence_front_image;
  File? _driving_licence_rear_image;
  File? _nic_front_image;
  File? _nic_rear_image;
  File? _billing_proof_image;

  bool checkbox_value = false;

  @override
  void dispose() {
    _driving_licence_number_controller.dispose();
    _expiration_date_controller.dispose();
    super.dispose();
  }

  //Image picker function to get image from gallery
  Future getImageFromGallery(int field) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (field == 1) {
          _profile_image = File(pickedFile.path);
        } else if (field == 2) {
          _driving_licence_front_image = File(pickedFile.path);
        } else if (field == 3) {
          _driving_licence_rear_image = File(pickedFile.path);
        } else if (field == 4) {
          _nic_front_image = File(pickedFile.path);
        } else if (field == 5) {
          _nic_rear_image = File(pickedFile.path);
        } else if (field == 6) {
          _billing_proof_image = File(pickedFile.path);
        }
      }
    });
  }

  //Image picker function to get image from gallery
  Future getImageFromCamera(int field) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        if (field == 1) {
          _profile_image = File(pickedFile.path);
        } else if (field == 2) {
          _driving_licence_front_image = File(pickedFile.path);
        } else if (field == 3) {
          _driving_licence_rear_image = File(pickedFile.path);
        } else if (field == 4) {
          _nic_front_image = File(pickedFile.path);
        } else if (field == 5) {
          _nic_rear_image = File(pickedFile.path);
        } else if (field == 6) {
          _billing_proof_image = File(pickedFile.path);
        }
      }
    });
  }

  void _showImageSourceActionSheet(BuildContext context, int field) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.pop(context);
                getImageFromCamera(field);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                getImageFromGallery(field);
              },
            ),
          ],
        ),
      ),
    );
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
                fill_percentage: 0.55,
                text: "50% complete",
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Personal Document Upload',
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
                'assets/images/document.png',
                width: 130.00,
                height: 130.00,
              )),
              const SizedBox(
                height: 40.0,
              ),
              Center(
                child: SizedBox(
                  width: 380,
                  height: 210,
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
                            'Profile Photo',
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
                            height: 90,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(4.0),
                                dashPattern: [8, 4],
                                strokeWidth: 1.0,
                                color: Colors.grey,
                                child: InkWell(
                                  onTap: () =>
                                      _showImageSourceActionSheet(context, 1),
                                  child: Container(
                                    width: 330,
                                    height: 90,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _profile_image == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(_profile_image!.path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'Profile Photo',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red))
                                            ])),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: SizedBox(
                  width: 380,
                  height: 530,
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
                            'Driving License',
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
                            height: 90,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(4.0),
                                dashPattern: [8, 4],
                                strokeWidth: 1.0,
                                color: Colors.grey,
                                child: InkWell(
                                  onTap: () =>
                                      _showImageSourceActionSheet(context, 2),
                                  child: Container(
                                    width: 330,
                                    height: 90,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _driving_licence_front_image == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(
                                                    _driving_licence_front_image!
                                                        .path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'Driving Licence Front',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red))
                                            ])),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 90,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(4.0),
                                dashPattern: [8, 4],
                                strokeWidth: 1.0,
                                color: Colors.grey,
                                child: InkWell(
                                  onTap: () =>
                                      _showImageSourceActionSheet(context, 3),
                                  child: Container(
                                    width: 330,
                                    height: 90,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _driving_licence_rear_image == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(
                                                    _driving_licence_rear_image!
                                                        .path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'Driving Licence Rear',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red))
                                            ])),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: TextFormField(
                              maxLength: 20,
                              keyboardType: TextInputType.name,
                              controller: _driving_licence_number_controller,
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Driving Licence Number',
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
                              maxLength: 20,
                              keyboardType: TextInputType.name,
                              controller: _expiration_date_controller,
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
                                          _expiration_date_controller.text =
                                              formattedDate;
                                        });
                                      }
                                    },
                                  ),
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Expiration Date',
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
                                    _expiration_date_controller.text =
                                        formattedDate;
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 65,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: this.checkbox_value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.checkbox_value = value!;
                                    });
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                    'My licence does not have an expiry date.\n(for older licences)',
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
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
                height: 10.0,
              ),
              Center(
                child: SizedBox(
                  width: 380,
                  height: 300,
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
                            'National Identity Card',
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
                            height: 90,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(4.0),
                                dashPattern: [8, 4],
                                strokeWidth: 1.0,
                                color: Colors.grey,
                                child: InkWell(
                                  onTap: () =>
                                      _showImageSourceActionSheet(context, 4),
                                  child: Container(
                                    width: 330,
                                    height: 90,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _nic_front_image == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(
                                                    _nic_front_image!
                                                        .path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'NIC - Front',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red))
                                            ])),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 90,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(4.0),
                                dashPattern: [8, 4],
                                strokeWidth: 1.0,
                                color: Colors.grey,
                                child: InkWell(
                                  onTap: () =>
                                      _showImageSourceActionSheet(context, 5),
                                  child: Container(
                                    width: 330,
                                    height: 90,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _nic_rear_image == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(
                                                    _nic_rear_image!
                                                        .path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'NIC - Rear',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red))
                                            ])),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: SizedBox(
                  width: 380,
                  height: 260,
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
                            'Billing Proof(optional)',
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
                            height: 90,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(4.0),
                                dashPattern: [8, 4],
                                strokeWidth: 1.0,
                                color: Colors.grey,
                                child: InkWell(
                                  onTap: () =>
                                      _showImageSourceActionSheet(context, 6),
                                  child: Container(
                                    width: 330,
                                    height: 90,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _billing_proof_image == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(
                                                    _billing_proof_image!.path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'Billing Proof',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      color: Colors.red))
                                            ])),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            'Billing Proof is used to confirm your address.It can be a utility bill(water,electricity or landline phone) or a bank statement with your correct address.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
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
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
