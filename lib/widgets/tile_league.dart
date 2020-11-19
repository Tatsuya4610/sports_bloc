import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_router.dart';
import 'package:flutter_bloc_first/model/model_team.dart';
import 'icon_widget.dart';
import 'package:flutter_bloc_first/model/model_league.dart';

class TileLeague extends StatelessWidget {
  final League league;
  TileLeague(this.league);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(league.name),
      leading: IconWidget(url: league.images.badge,size: 40,),
      onTap: () {
        Navigator.of(context).push(BlocRouter().leagueDetail(league));
      },
    );
  }
}
