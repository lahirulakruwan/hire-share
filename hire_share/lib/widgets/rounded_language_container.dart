import 'package:flutter/material.dart';
import 'package:hire_share/Login.dart';

class RoundedLanguageContainer extends StatelessWidget {
  final String language;

  RoundedLanguageContainer({required this.language});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () =>Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> LoginScreen())
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
        width: 0.5,
        style: BorderStyle.solid,
       ),
      ),
      child: Container(
        width: 270,
        height: 60,
        child: Center(
          child: Text(
            language,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}
