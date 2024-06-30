// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DayRatesWidget extends StatefulWidget {
  static final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  final double dialogWidth;
  const DayRatesWidget({
    Key? key,
    required this.dialogWidth,
  }) : super(key: key);

  @override
  State<DayRatesWidget> createState() => _DayRatesWidgetState();
}

class _DayRatesWidgetState extends State<DayRatesWidget> {
  TextEditingController rate1 = TextEditingController();
  TextEditingController rate2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: DayRatesWidget.formKey3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                'Half Day rate',
                style: TextStyle(fontSize: 16),
              ),
              Container(
                height: 75,
                width: widget.dialogWidth * 0.41,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: rate1,
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
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      if (DayRatesWidget.formKey3.currentState != null) {
                        DayRatesWidget.formKey3.currentState!.validate();
                        return null;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Full Day rate',
                style: TextStyle(fontSize: 16),
              ),
              Container(
                height: 75,
                width: widget.dialogWidth * 0.41,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: rate2,
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
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      if (DayRatesWidget.formKey3.currentState != null) {
                        DayRatesWidget.formKey3.currentState!.validate();
                        return null;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
