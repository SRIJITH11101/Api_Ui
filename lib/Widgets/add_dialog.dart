import 'package:flutter/material.dart';
import 'package:task_03/Networking/lang_pair.dart';
import 'package:task_03/Networking/sub_category.dart';
import 'package:task_03/Widgets/display_dropdown_field.dart';
import 'package:task_03/Widgets/display_inp_field.dart';
import 'package:task_03/Widgets/lang_dropdown.dart';
import 'package:task_03/Widgets/commerce_t.dart';
import 'package:task_03/Widgets/congress_s.dart';
import 'package:task_03/Widgets/day_rates.dart';
import 'package:task_03/Widgets/doctor.dart';
import 'package:task_03/Widgets/exp_dropdown.dart';
import 'package:task_03/Widgets/laywer.dart';
import 'package:task_03/Widgets/notary.dart';
import 'package:task_03/Widgets/private.dart';

class AddDialogWidget extends StatefulWidget {
  final Function(
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String,
  ) onSubmittingName;
  static List<List<int>> totalCommisionLimit = [];
  final BuildContext context;
  const AddDialogWidget({
    super.key,
    required this.context,
    required this.onSubmittingName,
  });

  @override
  State<AddDialogWidget> createState() => _AddDialogWidgetState();
}

class _AddDialogWidgetState extends State<AddDialogWidget> {
  final GlobalKey<FormState> txtformKey1 = CommerceWidget.formKey1;
  final GlobalKey<FormState> txtformKey2 = CongressWidget.formKey2;
  final GlobalKey<FormState> txtformKey3 = DayRatesWidget.formKey3;
  final GlobalKey<FormState> txtformKey4 = DoctorWidget.formKey4;
  final GlobalKey<FormState> txtformKey5 = LawyerWidget.formKey5;
  final GlobalKey<FormState> txtformKey6 = NotaryWidget.formKey6;
  final GlobalKey<FormState> txtformKey7 = PrivateWidget.formKey7;
  final TextEditingController comtext = TextEditingController();
  final TextEditingController congtext = TextEditingController();
  final TextEditingController hdaytext = TextEditingController();
  final TextEditingController wdaytext = TextEditingController();
  final TextEditingController doctext = TextEditingController();
  final TextEditingController lawtext = TextEditingController();
  final TextEditingController nottext = TextEditingController();
  final TextEditingController privtext = TextEditingController();

  List<int> commisionLimit = [];
  String langPairName = '';
  String exp = '';

  void submitDropdown(BuildContext context) {
    if (txtformKey1.currentState!.validate() &&
        txtformKey2.currentState!.validate() &&
        txtformKey3.currentState!.validate() &&
        txtformKey4.currentState!.validate() &&
        txtformKey5.currentState!.validate() &&
        txtformKey6.currentState!.validate() &&
        txtformKey7.currentState!.validate()) {
      print('#######$langPairName');

      AddDialogWidget.totalCommisionLimit.add(commisionLimit);
      print(AddDialogWidget.totalCommisionLimit);
      Navigator.pop(context);
      widget.onSubmittingName(
          langPairName,
          exp,
          comtext.text,
          congtext.text,
          hdaytext.text,
          wdaytext.text,
          doctext.text,
          lawtext.text,
          nottext.text,
          privtext.text);
      //sub.addLangList(langPairName);
      //Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double dialogHeight = MediaQuery.of(widget.context).size.height * 0.80;
    double dialogWidth = MediaQuery.of(context).size.width * 0.9;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              height: dialogHeight,
              width: dialogWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        'Add Language and Fees',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: dialogWidth * 0.9,
                        child: LanguageDropdown(
                          onCommisionLimitChanged: (newLimit) {
                            setState(() {
                              commisionLimit = newLimit;
                              //langPairName = LangPair().langPairName;
                            });
                          },
                          onLangPairNameChanged: (p0) {
                            langPairName = p0;
                            setState(() {
                              print('************$langPairName');
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          width: dialogWidth * 0.85,
                          child: ExpDropDown(
                            onExpChange: (p0) {
                              exp = p0;
                              print(exp);
                            },
                          )),
                      SizedBox(height: 10),
                      commisionLimit.isEmpty
                          ? CircularProgressIndicator()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommerceWidget(
                                  dialogWidth: dialogWidth,
                                  limitVal: commisionLimit[2],
                                  comtext: comtext,
                                ),
                                SizedBox(height: 10),
                                CongressWidget(
                                  dialogWidth: dialogWidth,
                                  limitVal: commisionLimit[3],
                                  context: congtext,
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: dialogWidth * 0.9,
                                  child: DayRatesWidget(
                                    dialogWidth: dialogWidth * 0.9,
                                    rate1: hdaytext,
                                    rate2: wdaytext,
                                  ),
                                ),
                                SizedBox(height: 10),
                                DoctorWidget(
                                  dialogWidth: dialogWidth,
                                  limitVal: commisionLimit[1],
                                  doctext: doctext,
                                ),
                                SizedBox(height: 10),
                                LawyerWidget(
                                  dialogWidth: dialogWidth,
                                  limitVal: commisionLimit[0],
                                  lawtext: lawtext,
                                ),
                                SizedBox(height: 10),
                                NotaryWidget(
                                  dialogWidth: dialogWidth,
                                  limitVal: commisionLimit[4],
                                  nottext: nottext,
                                ),
                                SizedBox(height: 10),
                                PrivateWidget(
                                  dialogWidth: dialogWidth,
                                  limitVal: commisionLimit[5],
                                  pritext: privtext,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.redAccent)),
                                        onPressed: () => Navigator.pop(context),
                                        child: Container(
                                          height: 20,
                                          width: 40,
                                          child: Text(
                                            'Back',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        )),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.greenAccent)),
                                      onPressed: () {
                                        submitDropdown(context);
                                        //Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 40,
                                        child: Text(
                                          'Add',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 300,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}//[77, 60, 66, 75, 190, 55]
