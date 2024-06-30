import 'package:flutter/material.dart';

class LawyerWidget extends StatefulWidget {
  const LawyerWidget({super.key, required this.dialogWidth});
  final double dialogWidth;
  static final GlobalKey<FormState> formKey5 = GlobalKey<FormState>();

  @override
  State<LawyerWidget> createState() => _LawyerWidgetState();
}

class _LawyerWidgetState extends State<LawyerWidget> {
  TextEditingController lawtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: LawyerWidget.formKey5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lawyer / Court (Minimum fee: 77))',
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
                controller: lawtext,
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
                  } else if (double.parse(value) < 60.0) {
                    return 'Please enter a value greater than 60';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  if (LawyerWidget.formKey5.currentState != null) {
                    LawyerWidget.formKey5.currentState!.validate();
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
