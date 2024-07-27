import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OnBoardingProgressBarWidget extends StatefulWidget {
  final double fill_percentage;
  final String text;

  OnBoardingProgressBarWidget({required this.fill_percentage,required this.text});

  @override
  State<OnBoardingProgressBarWidget> createState() =>
      _OnBoardingProgressBarWidgetState();
}

class _OnBoardingProgressBarWidgetState
    extends State<OnBoardingProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 const Text(
                    'YOUR PROGRESS',
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 150.0),
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                          color: Colors.green,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Stack(children: [
                LinearPercentIndicator(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  barRadius: const Radius.circular(15.0),
                  width: 370.0,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 15.0,
                  percent: widget.fill_percentage,
                  progressColor: Colors.green,
                  backgroundColor: Colors.lightGreen[200],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, top: 2.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0, top: 2.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0, top: 2.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, top: 2.0),
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
