import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:task_03/Models/language_model.dart';
import 'package:task_03/Networking/expList.dart';
import 'package:task_03/Networking/lang_pair.dart';
import 'package:task_03/Networking/sub_category.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  SubCategory sc = SubCategory();
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
        await sc.getSubCategoryDetails(_langOne, _langTwo);

        //Future.delayed(Duration(seconds: 3));
        setState(() {});
        log('changing value to: $value');
        //SubCategory().getSubCategoryDetails(_langOne, _langTwo);
        print('$_langOne and $_langTwo');
        //SubCategory().getSubCategoryDetails(_langOne, _langTwo);
      },
    );
  }
}



//need to add a list and access it outside in add dialog class to build future builder.