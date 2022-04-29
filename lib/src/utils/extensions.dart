import 'dart:convert';
import 'package:crypto/crypto.dart';

extension SplitByLenth on String {
  List<String> splitByLength() => [substring(0, length), substring(length)];

  String generateMd5() {
    return md5.convert(utf8.encode(this)).toString();
  }
}
