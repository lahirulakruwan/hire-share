import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hire_share/widgets/common_button_widget.dart';
import 'package:hire_share/widgets/onboarding_app_bar.dart';
import 'package:hire_share/widgets/onboarding_progress_bar_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class VehicleDocumentsWidget extends StatefulWidget {
  const VehicleDocumentsWidget({super.key});

  @override
  State<VehicleDocumentsWidget> createState() => _VehicleDocumentsWidgetState();
}

class _VehicleDocumentsWidgetState extends State<VehicleDocumentsWidget> {
  final _expiration_date_for_vehicle_revenue_license_controller =
      TextEditingController();
  final _expiration_insurance_controller = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File? _vehicle_revenue_license;
  File? _vehicle_insurance;
  File? _vehicle_registration_document;
  File? _vehicle_affidavit_document;

  @override
  void dispose() {
    _expiration_insurance_controller.dispose();
    _expiration_date_for_vehicle_revenue_license_controller.dispose();
    super.dispose();
  }

  //Image picker function to get image from gallery
  Future getImageFromGallery(int field) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (field == 1) {
          _vehicle_revenue_license = File(pickedFile.path);
        } else if (field == 2) {
          _vehicle_insurance = File(pickedFile.path);
        } else if (field == 3) {
          _vehicle_registration_document = File(pickedFile.path);
        } else if (field == 4) {
          _vehicle_affidavit_document = File(pickedFile.path);
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
          _vehicle_revenue_license = File(pickedFile.path);
        } else if (field == 2) {
          _vehicle_insurance = File(pickedFile.path);
        } else if (field == 3) {
          _vehicle_registration_document = File(pickedFile.path);
        } else if (field == 4) {
          _vehicle_affidavit_document = File(pickedFile.path);
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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const OnBoardingAppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnBoardingProgressBarWidget(
                  fill_percentage: 0.90, text: "90% complete"),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Vehicle Document Upload',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 10.0,
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
                height: 20.0,
              ),
              Center(
                  child: Image.asset(
                'assets/images/list.png',
                width: 150.00,
                height: 150.00,
              )),
              const SizedBox(
                height: 40.0,
              ),
              Center(
                child: Container(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.4,
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
                            'Vehicle Revenue License',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: screenWidth * 0.95,
                            height: screenHeight * 0.13,
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
                                    width: screenWidth * 0.95,
                                    height: screenHeight * 0.13,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _vehicle_revenue_license == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(_vehicle_revenue_license!
                                                    .path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text:
                                                    'Vehicle Revenue \nLicense',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: '*',
                                                  style: TextStyle(
                                                      color: Colors.red))
                                            ])),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: screenWidth * 0.95,
                            height: screenHeight * 0.13,
                            child: TextFormField(
                              maxLength: 20,
                              keyboardType: TextInputType.name,
                              controller:
                                  _expiration_date_for_vehicle_revenue_license_controller,
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
                                          _expiration_date_for_vehicle_revenue_license_controller
                                              .text = formattedDate;
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
                                    _expiration_date_for_vehicle_revenue_license_controller
                                        .text = formattedDate;
                                  });
                                }
                              },
                            ),
                          ),
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
                child: Container(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.4,
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
                            'Vehicle Insurance',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: screenWidth * 0.95,
                            height: screenHeight * 0.13,
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
                                    width: screenWidth * 0.95,
                                    height: screenHeight * 0.13,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _vehicle_insurance == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(_vehicle_insurance!.path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'Vehicle Insurance',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: '*',
                                                  style: TextStyle(
                                                      color: Colors.red))
                                            ])),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: screenWidth * 0.95,
                            height: screenHeight * 0.13,
                            child: TextFormField(
                              maxLength: 20,
                              keyboardType: TextInputType.name,
                              controller: _expiration_insurance_controller,
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
                                          _expiration_insurance_controller
                                              .text = formattedDate;
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
                                    _expiration_insurance_controller.text =
                                        formattedDate;
                                  });
                                }
                              },
                            ),
                          ),
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
                child: Container(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.27,
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
                            'Vehicle Registration Document',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: screenWidth * 0.95,
                            height: screenHeight * 0.13,
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
                                    width: screenWidth * 0.95,
                                    height: screenHeight * 0.13,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _vehicle_registration_document == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(
                                                    _vehicle_registration_document!
                                                        .path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text:
                                                    'Vehicle Registration \nDocument',
                                                style: TextStyle(color: Color(0xFF000080), fontStyle: FontStyle.normal, fontSize: 18, fontWeight: FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: '*',
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
                height: 10.0,
              ),
              Center(
                child: Container(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.27,
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
                            'Affidavit Document',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: screenWidth * 0.95,
                            height: screenHeight * 0.13,
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
                                    width: screenWidth * 0.95,
                                    height: screenHeight * 0.13,
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Row(
                                      children: [
                                        _vehicle_affidavit_document == null
                                            ? const Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              )
                                            : Image.file(
                                                File(
                                                    _vehicle_affidavit_document!
                                                        .path),
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                        const SizedBox(width: 30.0),
                                        RichText(
                                            text: const TextSpan(
                                                text: 'Affidavit Document',
                                                style: TextStyle(
                                                    color: Color(0xFF000080),
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                              TextSpan(
                                                  text: '*',
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
                height: 70,
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
            ],
          ),
        ),
      ),
    );
  }
}
