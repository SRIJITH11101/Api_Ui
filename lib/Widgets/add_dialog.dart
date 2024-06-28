import 'package:flutter/material.dart';
import 'package:task_03/Networking/lang_pair.dart';
import 'package:task_03/Widgets/commerce_t.dart';
import 'package:task_03/Widgets/congress_s.dart';
import 'package:task_03/Widgets/exp_dropdown.dart';
import 'package:task_03/Widgets/lang_dropdown.dart';

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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                      height: 100,
                      child: Text('Hello'),
                    ),
                    SizedBox(
                      height: 100,
                      child: Text('Hello'),
                    ),
                    SizedBox(
                      height: 100,
                      child: Text('Hello'),
                    ),
                    SizedBox(
                      height: 100,
                      child: Text('Hello'),
                    ),
                    SizedBox(
                      height: 100,
                      child: Text('Hello'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
