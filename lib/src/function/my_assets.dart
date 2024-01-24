import 'package:flutter/services.dart';

class MyAssets {
  Future<String> textFileLoading(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<ByteData> assetsLoading(String path) async {
    return await rootBundle.load(path);
  }

  Future<Uint8List> assetsLoading2(String path) async {
    return (await rootBundle.load(path)).buffer.asUint8List();
  }
}
