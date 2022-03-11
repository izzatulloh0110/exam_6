import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import '../model/card_model.dart';

class DBService {
  static const String dbName = "db_card";
  static Box box = Hive.box(dbName);

  static Future<void> storeMode(bool isLight) async {
    await box.put("isLight", isLight);
  }

  static bool loadMode() {
    return box.get("isLight", defaultValue: true);
  }

  static Future<void> storecard(List<CardModel> noteList) async {
    // object => map => String
    List<String> stringList = noteList.map((note) => jsonEncode(note.toJson())).toList();
    await box.put("card", stringList);
  }

  static List<CardModel> loadCard() {
    // String =>  Map => Object
    List<String> stringList = box.get("card") ?? <String>[];
    List<CardModel> noteList = stringList.map((string) => CardModel.fromJson(jsonDecode(string))).toList();
    return noteList;
  }

  static Future<void> removecard() async {
    await box.delete("card");
  }
}