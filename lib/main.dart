import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_provider.dart';
import 'package:flutter_bloc_first/blocs/bloc_router.dart';
import 'package:flutter_bloc_first/blocs/bloc_sport.dart';
import 'package:flutter_bloc_first/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

//https://www.thesportsdb.com/のスポーツAPIから情報取得。

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocRouter().allSports(),
    );
  }
}