library my_simple_hive;

import 'package:hive_flutter/hive_flutter.dart';

class MySimpleHiveSpell {
  static _ready(
    String tableName,
  ) async {
    if (!Hive.isBoxOpen(tableName)) {
      await Hive.openBox(tableName);
    }
  }

  static Future<bool?> getBool(String name, {String boxName = "myBox"}) async {
    await _ready(boxName);
    var box = await Hive.openBox(boxName);

    return box.get(name);
  }

  static Future<String?> getString(String name,
      {String boxName = "myBox"}) async {
    await _ready(boxName);
    var box = await Hive.openBox(boxName);

    return box.get(name);
  }

  static Future<int?> getInt(String name, {String boxName = "myBox"}) async {
    await _ready(boxName);
    var box = await Hive.openBox(boxName);

    return box.get(name);
  }

  static Future<double?> getDouble(String name,
      {String boxName = "myBox"}) async {
    await _ready(boxName);
    var box = await Hive.openBox(boxName);

    return box.get(name);
  }

  static Future<void> set(String name, dynamic value,
      {String boxName = "myBox"}) async {
    await _ready(boxName);
    var box = await Hive.openBox(boxName);

    await box.put(name, value);
    return;
  }
}
