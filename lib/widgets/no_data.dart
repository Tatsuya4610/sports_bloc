import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String text;
  NoData(this.text);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
