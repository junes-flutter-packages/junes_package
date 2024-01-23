import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyLangCode {
  String getLanguageCodeBySystem() {
    return Intl.getCurrentLocale().substring(0, 2);
  }

  String getLanguageCodeByApp(BuildContext context) {
    return Localizations.localeOf(context).languageCode;
  }
}
