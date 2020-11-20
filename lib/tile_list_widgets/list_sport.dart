import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/model/model_sport.dart';
import 'package:flutter_bloc_first/tile_list_widgets/tile_sport.dart';

class ListSport extends StatelessWidget {
  final List<Sport> sport;
  ListSport(this.sport);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, //横にListView
      itemCount: sport.length,
      itemBuilder: (ctx, index) {
        return TileSport(sport[index]);
      },
    );
  }
}
