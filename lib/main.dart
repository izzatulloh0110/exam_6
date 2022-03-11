import 'package:exam_6/pages/detail_page.dart';
import 'package:exam_6/pages/home_page.dart';
import 'package:exam_6/services/card_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(DBService.dbName);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: DBService.box.listenable(),
        builder: (context, box, widget) {
          return MaterialApp(
            home: HomePage(),
            routes: {
              HomePage.id: (context) => HomePage(),
              DetailPage.id: (context) => DetailPage()
            },
          );
        });
  }
}
