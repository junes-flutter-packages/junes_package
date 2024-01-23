import 'dart:io';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TimeAgo {
  TimeAgoSpell() {}

  String getAge(DateTime dateTime, BuildContext? context, {String? locale}) {
    // print("check this:$locale}");
    return timeago.format(dateTime,
        locale: locale ??
            context?.locale.languageCode ??
            Platform.localeName.substring(0, 2));
  }
}
