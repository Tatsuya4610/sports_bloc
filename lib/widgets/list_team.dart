import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/model/model_team.dart';
import 'package:flutter_bloc_first/widgets/tile_team.dart';

class ListTeam extends StatelessWidget {
  final List<Team> teams;
  ListTeam(this.teams);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, i) => TileTeam(teams[i]),
      itemCount: teams.length,
      separatorBuilder: (ctx, i) => Divider(),
    );
  }
}
