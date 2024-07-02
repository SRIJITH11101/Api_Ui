import 'package:flutter/material.dart';

class PrivateWidget extends StatefulWidget {
  final TextEditingController pritext;
  static final GlobalKey<FormState> formKey7 = GlobalKey<FormState>();
  final double dialogWidth;
  final int limitVal;
  const PrivateWidget(
      {super.key,
      required this.dialogWidth,
      required this.limitVal,
      required this.pritext});

  @override
  State<PrivateWidget> createState() => _PrivateWidgetState();
}

class _PrivateWidgetState extends State<PrivateWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: PrivateWidget.formKey7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Private (Minimum fee: ${widget.limitVal}))',
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
                controller: widget.pritext,
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
                  if (PrivateWidget.formKey7.currentState != null) {
                    PrivateWidget.formKey7.currentState!.validate();
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
