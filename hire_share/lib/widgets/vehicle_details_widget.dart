import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hire_share/widgets/onboarding_app_bar.dart';
import 'package:image_picker/image_picker.dart';

import 'common_button_widget.dart';
import 'onboarding_progress_bar_widget.dart';

class VehicleDetailsWidget extends StatefulWidget {
  const VehicleDetailsWidget({super.key});

  @override
  State<VehicleDetailsWidget> createState() => _VehicleDetailsWidgetState();
}

class _VehicleDetailsWidgetState extends State<VehicleDetailsWidget> {
  String makeValue = 'Honda';
  final List<String> makeItems = ['Honda', 'Toyota'];
  String modelValue = 'Civic';
  final List<String> modelItems = ['Civic', 'Vagon-R'];
  String? _selectedColorName;
  Color? _selectedColorValue;

  final Map<String, Color> colorMap = {
    'Red': Colors.red,
    'Pink': Colors.pink,
    'Purple': Colors.purple,
    'Deep Purple': Colors.deepPurple,
    'Indigo': Colors.indigo,
    'Blue': Colors.blue,
    'Light Blue': Colors.lightBlue,
    'Cyan': Colors.cyan,
    'Teal': Colors.teal,
    'Green': Colors.green,
    'Light Green': Colors.lightGreen,
    'Lime': Colors.lime,
    'Yellow': Colors.yellow,
    'Amber': Colors.amber,
    'Orange': Colors.orange,
    'Deep Orange': Colors.deepOrange,
    'Brown': Colors.brown,
    'Grey': Colors.grey,
    'Blue Grey': Colors.blueGrey,
  };

  DateTime _selectedYear = DateTime.now();
  bool _isFetching = false;

  final _year_of_manufacture_controller = TextEditingController();
  final _license_plate_number_controller = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _vehicle_front_side_image;
  File? _vehicle_side_view_image;
  File? _vehicle_interior_image;

  @override
  void initState() {
    super.initState();
    if (_year_of_manufacture_controller.text.isNotEmpty) {
      final year = int.tryParse(_year_of_manufacture_controller.text);
      if (year != null) {
        _selectedYear = DateTime(year);
      }
    }
  }

  @override
  void dispose() {
    _year_of_manufacture_controller.dispose();
    super.dispose();
  }

  void _showPicker(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: const Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text('Select a Year'),
              ],
            ),
            content: Container(
              width: 300,
              height: 300,
              child: YearPicker(
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime(DateTime.now().year + 120),
                initialDate: _selectedYear ?? DateTime.now(),
                selectedDate: _selectedYear ?? DateTime.now(),
                onChanged: (DateTime dateTime) async {
                  Navigator.pop(context);
                  setState(() {
                    _selectedYear = dateTime;
                    _year_of_manufacture_controller.text =
                        dateTime.year.toString();
                  });
                },
              ),
            ),
          );
        }));
  }

  //Image picker function to get image from gallery
  Future getImageFromGallery(int field) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (field == 1) {
          _vehicle_front_side_image = File(pickedFile.path);
        } else if (field == 2) {
          _vehicle_side_view_image = File(pickedFile.path);
        } else if (field == 3) {
          _vehicle_interior_image = File(pickedFile.path);
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
          _vehicle_front_side_image = File(pickedFile.path);
        } else if (field == 2) {
          _vehicle_side_view_image = File(pickedFile.path);
        } else if (field == 3) {
          _vehicle_interior_image = File(pickedFile.path);
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
                  fill_percentage: 0.73, text: "75% complete"),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Vehicle Details',
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
                'assets/images/steering.png',
                width: 200.00,
                height: 200.00,
              )),
              const SizedBox(
                height: 40.0,
              ),
              Center(
                child: SizedBox(
                  width: 380,
                  height: 630,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 25.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Vehicle Information',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Make',
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
                              value: makeValue,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              items: makeItems.map<DropdownMenuItem<String>>(
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
                                  makeValue = newValue!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Model',
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
                              value: modelValue,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              items: modelItems.map<DropdownMenuItem<String>>(
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
                                  makeValue = newValue!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          GestureDetector(
                            onTap: () => _showPicker(context),
                            child: SizedBox(
                              width: 330,
                              height: 80,
                              child: AbsorbPointer(
                                child: TextFormField(
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  controller: _year_of_manufacture_controller,
                                  decoration: InputDecoration(
                                      counterText: '',
                                      label: RichText(
                                          text: const TextSpan(
                                              text: 'Year of Manufacture',
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
                                              BorderRadius.circular(4.0)),
                                      suffixIcon: IconButton(
                                        onPressed: () => _showPicker(context),
                                        icon: const Icon(Icons.calendar_month),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'Vehicle Colour',
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
                              value: _selectedColorName,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              items: colorMap.keys
                                  .map<DropdownMenuItem<String>>(
                                      (String? colorName) {
                                return DropdownMenuItem(
                                  value: colorName,
                                  child: Row(
                                    children: [
                                      Text(
                                        colorName.toString(),
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
                                  _selectedColorName = newValue!;
                                  _selectedColorValue = colorMap[newValue!];
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 330,
                            height: 70,
                            child: TextFormField(
                              maxLength: 15,
                              keyboardType: TextInputType.name,
                              controller: _license_plate_number_controller,
                              decoration: InputDecoration(
                                  counterText: '',
                                  label: RichText(
                                      text: const TextSpan(
                                          text: 'License Plate Number',
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
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'E.g. : AAA 1234',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const SizedBox(
                            width: 330,
                            height: 40,
                            child: Text(
                              'NOTE: Avoid including hyphens and province \ninformation',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
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
                  height: 1220,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 25.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Vehicle Pictures',
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 358,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              elevation: 2.0,
                              child: Column(
                                children: [
                                  _vehicle_front_side_image == null
                                      ? Image.asset(
                                          'assets/images/frontside.jpg',
                                          width: 330,
                                          height: 250,
                                        )
                                      : Image.file(
                                          File(_vehicle_front_side_image!.path),
                                          width: 330,
                                          height: 250,
                                          fit: BoxFit.fill,
                                        ),
                                  SizedBox(
                                    width: 330,
                                    height: 100,
                                    child: InkWell(
                                      onTap: () => _showImageSourceActionSheet(
                                          context, 1),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: RichText(
                                                  text: const TextSpan(
                                                      text:
                                                          'Attach front-side \nphoto',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF000080),
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      children: [
                                                    TextSpan(
                                                      text: ' *',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            '\n(Must show license plate.)',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))
                                                  ])),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 70.0),
                                              child: Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 358,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              elevation: 2.0,
                              child: Column(
                                children: [
                                  _vehicle_side_view_image == null
                                      ? Image.asset(
                                          'assets/images/side.jpg',
                                          width: 330,
                                          height: 250,
                                        )
                                      : Image.file(
                                          File(_vehicle_side_view_image!.path),
                                          width: 330,
                                          height: 250,
                                          fit: BoxFit.fill,
                                        ),
                                  SizedBox(
                                    width: 330,
                                    height: 100,
                                    child: InkWell(
                                      onTap: () => _showImageSourceActionSheet(
                                          context, 2),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: RichText(
                                                  text: const TextSpan(
                                                      text:
                                                          'Attach side-view \nphoto',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF000080),
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      children: [
                                                    TextSpan(
                                                      text: ' *',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ])),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 80.0),
                                              child: Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: 330,
                            height: 358,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              elevation: 2.0,
                              child: Column(
                                children: [
                                  _vehicle_interior_image == null
                                      ? Image.asset(
                                          'assets/images/interior.png',
                                          width: 330,
                                          height: 250,
                                        )
                                      : Image.file(
                                          File(_vehicle_interior_image!.path),
                                          width: 330,
                                          height: 250,
                                          fit: BoxFit.fill,
                                        ),
                                  SizedBox(
                                    width: 330,
                                    height: 100,
                                    child: InkWell(
                                      onTap: () => _showImageSourceActionSheet(
                                          context, 3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: RichText(
                                                  text: const TextSpan(
                                                      text:
                                                          'Attach interior \nphoto',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF000080),
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      children: [
                                                    TextSpan(
                                                      text: ' *',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            '\n(Must show passenger \nseats.)',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400))
                                                  ])),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 85.0),
                                              child: Icon(
                                                Icons.add_a_photo_rounded,
                                                size: 35.0,
                                                color: Color(0xFF000080),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
