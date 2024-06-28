import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:task_03/Networking/expList.dart';

class ExpDropDown extends StatefulWidget {
  const ExpDropDown({super.key});

  @override
  State<ExpDropDown> createState() => _ExpDropDownState();
}

class _ExpDropDownState extends State<ExpDropDown> {
  List<String> _expList = [];

  Future<void> getExpList() async {
    ExpList exl = ExpList();
    await exl.getExpList();
    setState(() {
      _expList = exl.expList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExpList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      hintText: 'Select job role',
      items: _expList,
      //initialItem: _expList[0],
      onChanged: (value) {
        log('changing value to: $value');
      },
    );
  }
}
