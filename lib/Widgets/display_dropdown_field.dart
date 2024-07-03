import 'package:flutter/material.dart';

class DisplayDropDownField extends StatelessWidget {
  final double width;
  final String dispText;
  const DisplayDropDownField(
      {super.key, required this.width, required this.dispText});

  @override
  Widget build(BuildContext context) {
    TextEditingController dispCtrl = TextEditingController(text: dispText);
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Colors.black26, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: dispCtrl,
          readOnly: true,
          decoration: InputDecoration(
              fillColor: Colors.white, border: InputBorder.none),
        ),
      ),
    );
  }
}
