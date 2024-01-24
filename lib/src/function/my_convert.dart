import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class MyConvert {
  String mapToString(Map<String, Object?> _) {
    return json.encode(_);
  }

  Map<String, Object?> stringToMap(String? _) {
    if (_ == null || _ == "") return {};
    return json.decode(_);
  }

  String fromListToString(List<String> list) {
    return jsonEncode(list);
  }

  String fromListToSingleQuotesString(List<String> list) {
    String doubleQuotes = jsonEncode(list);
    return doubleQuotes.replaceAll('"', "'");
  }

  String fromListToStringForJS(List<String> list) {
    String string = jsonEncode(list);
    string = string.replaceAll('[', '');
    string = string.replaceAll(']', '');
    string = string.replaceAll('"', '');
    string = string.replaceAll('\'', '');
    return string;
  }

  String stringCheckForJS(String string) {
    string = string.replaceAll('[', '');
    string = string.replaceAll(']', '');
    string = string.replaceAll('"', '\'');
    return string;
  }

  Uint8List stringToUint8List(String str) {
    var encoded = utf8.encode(str);
    // final List<int> codeUnits = encoded.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(encoded);

    return unit8List;
  }

  String uint8ListToString(Uint8List uint8list) {
    return utf8.decode(uint8list);
    // return String.fromCharCodes(uint8list);
  }

  Future<Uint8List?> fileTo8List(File file) async {
    if (!await file.exists()) {
      return null;
    } else {
      return await file.readAsBytes();
    }
  }

  //string 으로 만들었던 list_view 를 다시 list_view 로 만들어줍니다. 디비등에 저장하기 위해사용합니다.
  List<String> fromStringToList(String json) {
    return (jsonDecode(json) as List<dynamic>).cast<String>();
  }

  double? stringToDouble(String _) {
    return double.tryParse(_);
  }

  int? stringToInt(String _) {
    return int.tryParse(_);
  }

  String? doubleToString(double _) {
    return _.toString();
  }

  String? intToString(int _) {
    return _.toString();
  }

  List<String>? stringToTag(String input) {
    List<String> list = input.split(',');
    for (var element in list) {
      if (element.contains(" ")) {
        return null;
      }
      if (element == "") {
        return null;
      }
    }
    return list;
  }
}
