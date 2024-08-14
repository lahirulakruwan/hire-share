import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hire_share/widgets/common_button_widget.dart';
import 'package:hire_share/widgets/onboarding_app_bar.dart';
import 'package:hire_share/widgets/onboarding_progress_bar_widget.dart';

class FinalStepWidget extends StatefulWidget {
  final String name;

  const FinalStepWidget({required this.name});

  @override
  State<FinalStepWidget> createState() => _FinalStepWidgetState();
}

class _FinalStepWidgetState extends State<FinalStepWidget> {
  final _something_about_you_controller = TextEditingController();

  String languageValue = 'Sinhala';
  final List<String> languageValues = ['Sinhala', 'Tamil', 'English'];
  String getToKnowPickMe = 'Other';
  final List<String> getToKnowPickMeValues = [
    'Other',
    'SocialMedia',
    'NewsPaper'
  ];
  String registrationProcess = 'Neutral';
  final List<String> registrationProcessValues = ['Neutral'];

  List<String> selectedCheckBoxlanguageValues = [];

  @override
  void dispose() {
    _something_about_you_controller.dispose();
    super.dispose();
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
                  fill_percentage: 1.0, text: "100% complete"),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Congratulations ${widget.name.toString()}',
                  style: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "You've successfully  completed the \nregistration process.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "One of our agents will reach you soon \nwith more details.",
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Before you go,',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Tell us a bit about yourself so your \npassengers/customers can get to know \nyou.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  width: screenWidth * 0.90,
                  height: screenHeight * 0.15,
                  child: TextFormField(
                    maxLength: 140,
                    keyboardType: TextInputType.multiline,
                    controller: _something_about_you_controller,
                    decoration: InputDecoration(
                        label: RichText(
                            text: const TextSpan(
                                text: 'Share something about you...',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                                children: [])),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.08,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 35,
                      ),
                      hint: const Text(
                        'Languages you know',
                        style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      items: languageValues.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          //disable default onTap to avoid closing menu when selecting an item
                          enabled: false,
                          child: StatefulBuilder(
                            builder: (context, menuSetState) {
                              final isSelected =
                                  selectedCheckBoxlanguageValues.contains(item);
                              return InkWell(
                                onTap: () {
                                  isSelected
                                      ? selectedCheckBoxlanguageValues
                                          .remove(item)
                                      : selectedCheckBoxlanguageValues
                                          .add(item);
                                  //This rebuilds the StatefulWidget to update the button's text
                                  setState(() {});
                                  //This rebuilds the dropdownMenu Widget to update the check mark
                                  menuSetState(() {});
                                },
                                child: Container(
                                  height: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      if (isSelected)
                                        const Icon(Icons.check_box_outlined)
                                      else
                                        const Icon(
                                            Icons.check_box_outline_blank),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                      value: selectedCheckBoxlanguageValues.isEmpty
                          ? null
                          : selectedCheckBoxlanguageValues.last,
                      onChanged: (value) {},
                      selectedItemBuilder: (context) {
                        return languageValues.map(
                          (item) {
                            return Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                selectedCheckBoxlanguageValues.join(', '),
                                style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                                maxLines: 1,
                              ),
                            );
                          },
                        ).toList();
                      },
                      buttonStyleData: ButtonStyleData(
                          padding: const EdgeInsets.only(left: 16, right: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4.0))),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 65.0),
                child: Text(
                  'Sinhala : I can...',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {},
                      backgroundColor: Colors.grey.shade300,
                      icon: const Icon(
                        Icons.hearing_rounded,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Understand',
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      extendedPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      extendedIconLabelSpacing: 5.0,
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {},
                      backgroundColor: Colors.grey.shade300,
                      icon: const Icon(
                        Icons.hearing_rounded,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Speak',
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      extendedPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      extendedIconLabelSpacing: 5.0,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0, right: 55.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 65.0),
                child: Text(
                  'English : I can...',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Row(
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {},
                      backgroundColor: Colors.grey.shade300,
                      icon: const Icon(
                        Icons.hearing_rounded,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Understand',
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      extendedPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      extendedIconLabelSpacing: 5.0,
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {},
                      backgroundColor: Colors.grey.shade300,
                      icon: const Icon(
                        Icons.hearing_rounded,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Speak',
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      extendedPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      extendedIconLabelSpacing: 5.0,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65.0, right: 55.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35.0),
                child: Text(
                  "How did you get to know about PickMe?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.08,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        counterText: '',
                        label: RichText(
                            text: const TextSpan(
                                text: 'Select Answer',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                                children: [])),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0))),
                    isExpanded: true,
                    iconSize: 30.0,
                    value: getToKnowPickMe,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    items: getToKnowPickMeValues
                        .map<DropdownMenuItem<String>>((String? item) {
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
                        getToKnowPickMe = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35.0),
                child: Text(
                  "I found this registration process to be...",
                  style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.08,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        counterText: '',
                        label: RichText(
                            text: const TextSpan(
                                text: 'Select Answer',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                                children: [])),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0))),
                    isExpanded: true,
                    iconSize: 30.0,
                    value: registrationProcess,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    items: registrationProcessValues
                        .map<DropdownMenuItem<String>>((String? item) {
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
                        registrationProcess = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 45.0,
              ),
              Center(
                child: CommonButtonWidget(
                    backgroundColor: Colors.indigo.shade900,
                    text: 'SAVE ANSWERS',
                    textColor: Colors.white,
                    borderRadius: 5,
                    width: 270,
                    height: 60,
                    fontSize: 16,
                    onPressed: () {}),
              ),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
