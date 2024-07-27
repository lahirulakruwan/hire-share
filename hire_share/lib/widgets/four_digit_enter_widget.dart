import 'package:flutter/material.dart';

class FourDigitEnterWidget extends StatefulWidget {
  const FourDigitEnterWidget({super.key});

  @override
  State<FourDigitEnterWidget> createState() => _FourDigitEnterWidgetState();
}

class _FourDigitEnterWidgetState extends State<FourDigitEnterWidget> {

  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: const Border.fromBorderSide(BorderSide(color:Colors.black)),
      ),
      child:  TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: ''
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
        maxLength: 1,
        cursorColor: Colors.black,
      ),
    );
  }
}
