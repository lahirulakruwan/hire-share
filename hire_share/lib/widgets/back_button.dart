import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconButton(
            onPressed:null,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30.0,
            ),
          );
  }
}