import 'package:flutter/material.dart';

class DisplayInputField extends StatefulWidget {
  final double width;
  final String dispText;
  final int limitVal;
  final GlobalKey<FormState> txtkey;
  TextEditingController ctrl;
  DisplayInputField(
      {super.key,
      required this.width,
      required this.dispText,
      required this.ctrl,
      required this.txtkey,
      required this.limitVal});

  @override
  State<DisplayInputField> createState() => _DisplayInputFieldState();
}

class _DisplayInputFieldState extends State<DisplayInputField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.ctrl.text = widget.dispText;
  }

  @override
  Widget build(BuildContext context) {
    //ctrl = TextEditingController();

    return Form(
      key: widget.txtkey,
      child: Container(
        height: 45,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.black26, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            //initialValue: dispText,
            keyboardType: TextInputType.phone,
            controller: widget.ctrl,
            decoration: InputDecoration(
                fillColor: Colors.white, border: InputBorder.none),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some value';
              } else if (value == null ||
                  double.tryParse(value.trim()) == null) {
                return 'Please enter a valid value';
              } else if (double.parse(value) < widget.limitVal) {
                return 'Please enter a value greater than ${widget.limitVal}';
              } else {
                return null;
              }
            },
            onChanged: (value) {
              if (widget.txtkey.currentState != null) {
                widget.txtkey.currentState!.validate();
                return null;
              }
            },
          ),
        ),
      ),
    );
  }
}
