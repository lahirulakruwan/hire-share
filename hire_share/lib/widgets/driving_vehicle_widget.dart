import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hire_share/widgets/onboarding_app_bar.dart';
import 'package:hire_share/widgets/onboarding_progress_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_button_widget.dart';

class DrivingVehicleWidget extends StatefulWidget {
  const DrivingVehicleWidget({super.key});

  @override
  State<DrivingVehicleWidget> createState() => _DrivingVehicleWidgetState();
}

class _DrivingVehicleWidgetState extends State<DrivingVehicleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnBoardingAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OnBoardingProgressBarWidget(
                fill_percentage: 0.65, text: "63% complete"),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'What are you driving?',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: SizedBox(
                width: 320,
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 4.0,
                  children: List.generate(vehicles.length, (index) {
                    return VehicleCard(vehicle: vehicles[index]);
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
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
          ],
        ),
      ),
    );
  }
}

class Vehicle {
  const Vehicle({required this.name, required this.icon});
  final String name;
  final Widget icon;
}

List<Vehicle> vehicles = <Vehicle>[
  Vehicle(
      name: 'Tuk',
      icon: Image.asset(
        'assets/images/rickshaw.png',
        width: 90.00,
        height: 90.00,
      )),
  Vehicle(
      name: 'Flex/Mini/Car',
      icon: Image.asset(
        'assets/images/vehicle.png',
        width: 90.00,
        height: 90.00,
      )),
  Vehicle(
      name: 'Mini Van/Van',
      icon: Image.asset(
        'assets/images/van.png',
        width: 90.00,
        height: 90.00,
      )),
  Vehicle(
      name: 'Truck',
      icon: Image.asset(
        'assets/images/lorry.png',
        width: 90.00,
        height: 90.00,
      )),
  Vehicle(
      name: 'Bike',
      icon: Image.asset(
        'assets/images/scooter.png',
        width: 90.00,
        height: 90.00,
      )),
];

class VehicleCard extends StatelessWidget {
  const VehicleCard({required this.vehicle});
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        elevation: 3.0,
        color: Colors.white,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: vehicle.icon),
                Text(vehicle.name,
                    style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ]),
        ));
  }
}
