import 'package:animated_custom_dropdown/custom_dropdown.dart';

class LanguageModel with CustomDropdownListFilter {
  final String languagepair;

  LanguageModel(this.languagepair);

  @override
  String toString() {
    return languagepair;
  }

  @override
  bool filter(String query) {
    return languagepair.toLowerCase().contains(query.toLowerCase());
  }
}
