import 'package:flutter/material.dart';

class CongressWidget extends StatefulWidget {
  static final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final TextEditingController context;
  final int limitVal;
  final double dialogWidth;
  const CongressWidget(
      {super.key,
      required this.dialogWidth,
      required this.limitVal,
      required this.context});

  @override
  State<CongressWidget> createState() => _CommerceWidgetState();
}

class _CommerceWidgetState extends State<CongressWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: CongressWidget.formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Congress/Simultaneous (Minimum fee : ${widget.limitVal}))',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            width: widget.dialogWidth * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: widget.context,
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                        height: 0), // Reduce the error text height to 0
                    //helperText: ' ',
                    border: InputBorder.none,
                    prefixIcon: null,
                    hintText: "Enter the value"),
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
                  if (CongressWidget.formKey2.currentState != null) {
                    CongressWidget.formKey2.currentState!.validate();
                    return null;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
