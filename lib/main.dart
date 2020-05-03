import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:profilproject/InfoPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InfoPage(),
    );
  }
}
