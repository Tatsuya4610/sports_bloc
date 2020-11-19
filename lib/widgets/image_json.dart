import 'package:flutter/material.dart';

class ImageJson extends StatelessWidget {
  final String url;
  final double heigth;

  ImageJson({this.url,this.heigth});

  @override
  Widget build(BuildContext context) {
    return (url == null) ?
        Container(child: Center(child: Text('画像なし'),),)
    : Container(child: Image.network(url, height: heigth,));
  }
}
