import 'package:flutter/material.dart';
import 'package:task_03/Networking/lang_pair.dart';
import 'package:task_03/Widgets/commerce_t.dart';
import 'package:task_03/Widgets/congress_s.dart';
import 'package:task_03/Widgets/day_rates.dart';
import 'package:task_03/Widgets/doctor.dart';
import 'package:task_03/Widgets/exp_dropdown.dart';
import 'package:task_03/Widgets/lang_dropdown.dart';
import 'package:task_03/Widgets/laywer.dart';
import 'package:task_03/Widgets/notary.dart';
import 'package:task_03/Widgets/private.dart';

class AddDialogWidget extends StatefulWidget {
  final BuildContext context;
  const AddDialogWidget({
    super.key,
    required this.context,
  });

  @override
  State<AddDialogWidget> createState() => _AddDialogWidgetState();
}

class _AddDialogWidgetState extends State<AddDialogWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //LangPair().getLangPair();
  }

  //double dialogHeight = MediaQuery.of(widget.context).size.height * 0.80;
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
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Add Language and Fees',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: dialogWidth * 0.9, child: LanguageDropdown()),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(width: dialogWidth * 0.7, child: ExpDropDown()),
                      SizedBox(
                        height: 10,
                      ),
                      CommerceWidget(
                        dialogWidth: dialogWidth,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CongressWidget(
                        dialogWidth: dialogWidth,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: dialogWidth * 0.9,
                          child: DayRatesWidget(
                            dialogWidth: dialogWidth * 0.9,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      DoctorWidget(dialogWidth: dialogWidth),
                      SizedBox(
                        height: 10,
                      ),
                      LawyerWidget(dialogWidth: dialogWidth),
                      SizedBox(
                        height: 10,
                      ),
                      NotaryWidget(dialogWidth: dialogWidth),
                      SizedBox(
                        height: 10,
                      ),
                      PrivateWidget(dialogWidth: dialogWidth),
                      SizedBox(
                        height: 20,
                      ),
                      //ElevatedButton(onPressed: onPressed, child: child)
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
}
