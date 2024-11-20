import 'package:flutter/material.dart';
import 'view/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Biodata Mahasiswa',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const ListPage(),
    );
  }
}
