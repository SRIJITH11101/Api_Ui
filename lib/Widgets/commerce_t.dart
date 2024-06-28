import 'package:flutter/material.dart';

class CommerceWidget extends StatefulWidget {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final double dialogWidth;
  const CommerceWidget({super.key, required this.dialogWidth});

  @override
  State<CommerceWidget> createState() => _CommerceWidgetState();
}

class _CommerceWidgetState extends State<CommerceWidget> {
  TextEditingController comtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: CommerceWidget.formKey,
      child: Column(
        children: [
          Text(
            'Commerce/Trade (Minimum fee : 50)',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            width: widget.dialogWidth * 0.7,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              controller: comtext,
              decoration: InputDecoration(
                  prefixIcon: null, hintText: "Enter the value"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some value';
                } else if (value == null ||
                    double.tryParse(value.trim()) == null) {
                  return 'Please enter a valid value';
                } else if (double.parse(value) < 50.0) {
                  return 'Please enter a value greater than 50';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                if (CommerceWidget.formKey.currentState != null) {
                  CommerceWidget.formKey.currentState!.validate();
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
