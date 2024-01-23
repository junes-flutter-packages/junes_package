import 'dart:convert';
import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:random_string/random_string.dart';

import 'my_date_time.dart';

class MyRandom {
  Color color({int? seed}) {
    return RandomColor(seed).randomColor();
  }

  int getInt(int maxSize) {
    return Random().nextInt(maxSize); // from 0 upto 100~maxSize included
  }

  /// 두 숫자 사이 랜덤 숫자 진행
  int getIntBetween(
    int from,
    int to,
  ) {
    return randomBetween(from,
        to); // some integer between 10 and 20 where 0 <= min <= max <= 999999999999999
  }

  /// 입력한 숫자만큼의 숫자나열을 반환
  String getNumeric(int numberCount) {
    return randomNumeric(numberCount); // sequence of 4 random numbers i.e. 3259
  }

  String string(int length) {
    return randomString(length);
  }

  Key key() {
    return Key(randomString(20));
  }

  String stringWithoutNumber(int len) {
    var r = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  String base64(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  String word() {
    return generateWordPairs().take(1).first.asString;
  }

  String word2() {
    String result = "";

    generateWordPairs().take(3).forEach((element) {
      result += ' ${element.asString}';
    });
    return result;
  }

  String name() {
    final faker = Faker.instance;

    return faker.name.fullName();
  }

  String FirstName() {
    final faker = Faker.instance;

    return faker.name.firstName(gender: Gender.female);
  }

  String lastName() {
    final faker = Faker.instance;

    return faker.name.lastName();
  }

  String address() {
    final faker = Faker.instance;

    return faker.address.toString();
  }

  String animal() {
    final faker = Faker.instance;

    return faker.animal.toString();
  }

  String company() {
    final faker = Faker.instance;
    return faker.company.toString();
  }

  String hacker() {
    final faker = Faker.instance;
    return faker.hacker.toString();
  }

  String music() {
    final faker = Faker.instance;
    return faker.music.toString();
  }

  String randomHex() {
    final faker = Faker.instance;

    return faker.datatype.hexaDecimal(); // 0xF74451AB
  }

  DateTime randomDateTimeInsideOneYears() {
    return MyDateTime()
        .afterDuration(DateTime.now(), Duration(hours: -1 * getInt(24 * 365)));
  }

  DateTime randomDateTimeInsideOneMonths() {
    return MyDateTime()
        .afterDuration(DateTime.now(), Duration(hours: -1 * getInt(24 * 30)));
  }
}
