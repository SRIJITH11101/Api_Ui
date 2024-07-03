import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_03/Constants/constant.dart';

import 'package:task_03/Models/input_details.dart';
import 'package:task_03/Widgets/add_dialog.dart';
import 'package:task_03/Widgets/display_dropdown_field.dart';
import 'package:task_03/Widgets/display_inp_field.dart';

class DisplayScreen extends StatelessWidget {
  final InputDetails ip;
  final int index;
  DisplayScreen({super.key, required this.ip, required this.index});
  // comtext.text = ip.commerce;
  // congtext.text = ip.congress;
  // hdaytext.text = ip.hdr;
  // wdaytext.text = ip.fdr;
  // doctext.text = ip.doctor;
  // lawtext.text = ip.lawyer;
  // nottext.text = ip.notary;
  // privtext.text = ip.private;
  // print(comtext.text);
  final GlobalKey<FormState> txtformKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> txtformKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> txtformKey3 = GlobalKey<FormState>();
  final GlobalKey<FormState> txtformKey4 = GlobalKey<FormState>();
  final GlobalKey<FormState> txtformKey5 = GlobalKey<FormState>();
  final GlobalKey<FormState> txtformKey6 = GlobalKey<FormState>();
  final GlobalKey<FormState> txtformKey7 = GlobalKey<FormState>();
  final GlobalKey<FormState> txtformKey8 = GlobalKey<FormState>();

  static TextEditingController comtext = TextEditingController();
  static TextEditingController congtext = TextEditingController();
  static TextEditingController hdaytext = TextEditingController();
  static TextEditingController wdaytext = TextEditingController();
  static TextEditingController doctext = TextEditingController();
  static TextEditingController lawtext = TextEditingController();
  static TextEditingController nottext = TextEditingController();
  static TextEditingController privtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Fees Structure',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Language:",
                style: dispStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DisplayDropDownField(width: width * 0.9, dispText: ip.language),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Experience:",
                style: dispStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DisplayDropDownField(width: width * 0.7, dispText: ip.exp),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Commerce/Trade:",
                style: dispStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DisplayInputField(
                width: width * 0.7,
                dispText: ip.commerce,
                ctrl: comtext,
                txtkey: txtformKey1,
                limitVal: AddDialogWidget.totalCommisionLimit[index][2],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Congress/Simultaneous:",
                style: dispStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DisplayInputField(
                width: width * 0.7,
                dispText: ip.congress,
                ctrl: congtext,
                txtkey: txtformKey2,
                limitVal: AddDialogWidget.totalCommisionLimit[index][3],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Half day \nRate:",
                        style: dispStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DisplayInputField(
                        width: width * 0.35,
                        dispText: ip.hdr,
                        ctrl: hdaytext,
                        txtkey: txtformKey3,
                        limitVal: 0,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Full day \nRate:",
                        style: dispStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DisplayInputField(
                        width: width * 0.35,
                        dispText: ip.fdr,
                        ctrl: wdaytext,
                        txtkey: txtformKey8,
                        limitVal: 0,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Doctor/Care:",
                style: dispStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DisplayInputField(
                width: width * 0.7,
                dispText: ip.doctor,
                ctrl: doctext,
                txtkey: txtformKey4,
                limitVal: AddDialogWidget.totalCommisionLimit[index][1],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Lawyer/Court:",
                style: dispStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DisplayInputField(
                width: width * 0.7,
                dispText: ip.lawyer,
                ctrl: lawtext,
                txtkey: txtformKey5,
                limitVal: AddDialogWidget.totalCommisionLimit[index][0],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Notary:",
                style: dispStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DisplayInputField(
                width: width * 0.7,
                dispText: ip.notary,
                ctrl: nottext,
                txtkey: txtformKey6,
                limitVal: AddDialogWidget.totalCommisionLimit[index][4],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Private:",
                style: dispStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DisplayInputField(
                width: width * 0.7,
                dispText: ip.private,
                ctrl: privtext,
                txtkey: txtformKey7,
                limitVal: AddDialogWidget.totalCommisionLimit[index][5],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Container(
                        height: 20,
                        width: 40,
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent)),
                    onPressed: () {
                      if (txtformKey1.currentState!.validate() &&
                          txtformKey2.currentState!.validate() &&
                          txtformKey3.currentState!.validate() &&
                          txtformKey4.currentState!.validate() &&
                          txtformKey5.currentState!.validate() &&
                          txtformKey6.currentState!.validate() &&
                          txtformKey7.currentState!.validate() &&
                          txtformKey8.currentState!.validate()) {
                        Navigator.pop(context, true);
                      }
                    },
                    child: Container(
                      height: 20,
                      width: 40,
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

         // Text(
            //   "Language: ${ip.language}",
            //   style: dispStyle,
            // ),
            // Text(
            //   "Experience: ${ip.exp}",
            //   style: dispStyle,
            // ),
            // Text(
            //   "Commerce/Trade: ${ip.commerce}",
            //   style: dispStyle,
            // ),
            // Text(
            //   "Congress/Simultaneous: ${ip.congress}",
            //   style: dispStyle,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Text(
            //       "Half day rate: ${ip.hdr}",
            //       style: dispStyle,
            //     ),
            //     SizedBox(
            //       width: 25,
            //     ),
            //     Text(
            //       "Full day rate: ${ip.fdr}",
            //       style: dispStyle,
            //     ),
            //   ],
            // ),
            // Text(
            //   "Doctor/Care: ${ip.doctor}",
            //   style: dispStyle,
            // ),
            // Text(
            //   "Lawyer/Court: ${ip.lawyer}",
            //   style: dispStyle,
            // ),
            // Text(
            //   "Notary: ${ip.notary}",
            //   style: dispStyle,
            // ),
            // Text(
            //   "Private: ${ip.private}",
            //   style: dispStyle,
            // ),