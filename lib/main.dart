import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_router.dart';

void main() {
  runApp(MyApp());
}

//https://www.thesportsdb.com/のスポーツAPIから情報取得。

class MyApp extends StatelessWidget {
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
