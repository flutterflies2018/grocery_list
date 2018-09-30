import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './screen2.dart';
import './screen1.dart';


void main() {
  runApp(
      new MaterialApp(
        home: new Screen2(),
        routes: <String, WidgetBuilder> {
          '/screen1': (BuildContext context) => new Screen1(),
          '/screen2': (BuildContext context) => new Screen2()
        },
      )
  );
}