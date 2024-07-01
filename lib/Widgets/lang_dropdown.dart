import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:task_03/Models/language_model.dart';
import 'package:task_03/Networking/expList.dart';
import 'package:task_03/Networking/lang_pair.dart';
import 'package:task_03/Networking/sub_category.dart';

class LanguageDropdown extends StatefulWidget {
  final Function(List<int>) onCommisionLimitChanged;
  final Function(String) onLangPairNameChanged;
  static List<int> commisionLimit = [];
  const LanguageDropdown(
      {super.key,
      required this.onCommisionLimitChanged,
      required this.onLangPairNameChanged});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  SubCategory sc = SubCategory();
  List<int> commisionLimit = [];
  List<LanguageModel> _languagePair = [];
  String _langOne = '';
  String _langTwo = '';
  String selectedLangPair = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchLanguagePair();
  }

  Future<void> _fetchLanguagePair() async {
    LangPair langPair = LangPair();
    await langPair.getLangPair();
    setState(() {
      _languagePair = langPair.languagePair;
    });
  }

  Future<void> _fetchLanguageCodes() async {
    LangPair langPair = LangPair();
    await langPair.getLangCodeWithName(selectedLangPair);
    setState(() {
      _langOne = langPair.langOne;
      _langTwo = langPair.langTwo;
    });
    //print(selectedLangPair);
    widget.onLangPairNameChanged(selectedLangPair);
  }

  Future<void> getSubCategoryDetails() async {
    setState(() {});
    await sc.getSubCategoryDetails(_langOne, _langTwo);
    print(sc.commisionLimit.cast<int>());
    widget.onCommisionLimitChanged(sc.commisionLimit.cast<int>());
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<LanguageModel>.search(
      hintText: 'Select language pair',
      items: _languagePair,
      excludeSelected: false,
      onChanged: (value) async {
        //print(value.toString());
        setState(() {
          selectedLangPair = value.toString();
        });
        await _fetchLanguageCodes();
        await getSubCategoryDetails();

        //Future.delayed(Duration(seconds: 3));
        setState(() {
          commisionLimit = sc.commisionLimit.cast<int>();
        });
        log('changing value to: $value');
        //SubCategory().getSubCategoryDetails(_langOne, _langTwo);
        print('$_langOne and $_langTwo');
        //SubCategory().getSubCategoryDetails(_langOne, _langTwo);
      },
    );
  }
}



//need to add a list and access it outside in add dialog class to build future builder.