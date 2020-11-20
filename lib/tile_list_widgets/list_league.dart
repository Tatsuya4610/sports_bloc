import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/model/model_league.dart';
import 'package:flutter_bloc_first/tile_list_widgets/tile_league.dart';

class ListLeague extends StatelessWidget {
  final List<League> leagues;

  ListLeague(this.leagues);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx,index) => TileLeague(leagues[index]),
      separatorBuilder: (ctx,index) => Divider(),
      itemCount: leagues.length,
    );
  }
}
