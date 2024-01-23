import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_random.dart';

class MyDateTime {
  int getNowMicrosTime() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  int getNowMillisTime() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  int convertToMicros(DateTime dateTime) {
    return dateTime.microsecondsSinceEpoch;
  }

  DateTime convertToDateTimeObject(int micros) {
    return DateTime.fromMicrosecondsSinceEpoch(micros);
  }

  DateTime convertToDateTimeObjectFromMillisecond(int micros) {
    return DateTime.fromMillisecondsSinceEpoch(micros);
  }

  String getMonthAndDayFromDateTimeObject(DateTime dateTime) {
    //datetime 객체에서 월/일 ->  11/3 이런식으로 돌려준다.
    return DateFormat('M/d').format(dateTime);
  }

  String getHourMinute(DateTime dateTime) {
    return DateFormat.jm().format(dateTime);
  }

  String getHourMinuteByMicroTime(int microTime) {
    return DateFormat.jm().format(convertToDateTimeObject(microTime));
  }

  String getPMHourMinuteByMicroTime(int microTime) {
    return DateFormat('a h:mm').format(convertToDateTimeObject(
        microTime)); //DateFormat.Hm().format(convertToDateTimeObject(microTime));
  }

  String getHourMinuteSecond(DateTime dateTime) {
    return DateFormat.jms().format(dateTime);
  }

  String getHourMinuteSecondByMicroTime(int microTime) {
    return DateFormat.jms().format(convertToDateTimeObject(microTime));
  }

  String getStringByMillisTime(int millisTime) {
    return DateFormat.yMd()
        .add_jms()
        .format(convertToDateTimeObjectFromMillisecond(millisTime));
  }

  DateTime monthAgo() {
    return afterDuration(DateTime.now(), const Duration(hours: -24 * 30));
  }

  DateTime randomDateTimeInsideOneYears() {
    return afterDuration(
        DateTime.now(), Duration(hours: -1 * MyRandom().getInt(24 * 365)));
  }

  DateTime randomDateTimeInsideOneMonths() {
    return afterDuration(
        DateTime.now(), Duration(hours: -1 * MyRandom().getInt(24 * 30)));
  }

  //해당 시간에서 원하는 년월일시분초를 골라서 바꿀때
  DateTime timePickChange(DateTime dateTime,
      {int? year, int? month, int? day, int? hour, int? minute, int? second}) {
    return DateTime(
        year ?? dateTime.year,
        month ?? dateTime.month,
        day ?? dateTime.day,
        hour ?? dateTime.hour,
        minute ?? dateTime.minute,
        second ?? dateTime.second);
  }

  DateTime afterDuration(DateTime dateTime, Duration duration) {
    return dateTime.add(duration);
  }

  //몇일뒤 시간 정하는 로직 (ex. 내일 오후 6시30분)
  DateTime afterDurationAndPickTime(DateTime dateTime, Duration duration,
      {int? year, int? month, int? day, int? hour, int? minute, int? second}) {
    var _ = afterDuration(dateTime, duration);
    // debugPrint(_);

    _ = timePickChange(
      _,
      year: year,
      month: year,
      day: day,
      hour: hour,
      minute: minute,
      second: second,
    );
    // debugPrint(_);
    return _;
  }

  DateTime thisWeekMondayDay() {
    var d = DateTime.now();
    var weekDay = d.weekday;
    var firstDayOfWeek = d.subtract(Duration(days: weekDay - 1));
    return firstDayOfWeek;
  }

  List<DateTime> thisWeekDaysTimeObject() {
    List<DateTime> _list = [];

    var d = DateTime.now();
    var weekDay = d.weekday;
    var firstDayOfWeek = d.subtract(Duration(days: weekDay - 1));
    _list.add(d.subtract(Duration(days: weekDay - 1))); //월
    _list.add(d.subtract(Duration(days: weekDay - 2))); //화
    _list.add(d.subtract(Duration(days: weekDay - 3))); //수
    _list.add(d.subtract(Duration(days: weekDay - 4))); //목
    _list.add(d.subtract(Duration(days: weekDay - 5))); //금
    _list.add(d.subtract(Duration(days: weekDay - 6))); //토
    _list.add(d.subtract(Duration(days: weekDay - 7))); //일

    return _list;
  }

  DateTime thisWeekSundayDay() {
    var d = DateTime.now();
    var weekDay = d.weekday;
    var firstDayOfWeek = d.subtract(Duration(days: weekDay - 7));
    return firstDayOfWeek;
  }

  getWeekString(DateTime dateTime) {
    int weekDay = dateTime.weekday;
    if (weekDay == 1) {
      return "월";
    } else if (weekDay == 2) {
      return "화";
    } else if (weekDay == 3) {
      return "수";
    } else if (weekDay == 4) {
      return "목";
    } else if (weekDay == 5) {
      return "금";
    } else if (weekDay == 6) {
      return "토";
    } else if (weekDay == 7) {
      return "일";
    }
    return "";
  }
}
