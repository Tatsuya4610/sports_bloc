import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/model/model_team.dart';
import 'package:flutter_bloc_first/screen/league_screen.dart';
import 'package:flutter_bloc_first/screen/team_screen.dart';
import 'package:flutter_bloc_first/widgets/icon_widget.dart';
import 'package:flutter_bloc_first/widgets/text_alternate.dart';
class TileTeam extends StatelessWidget {
  final Team team;
  TileTeam(this.team);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextAlternate(string: team.name,),
      leading: IconWidget(url: team.images.badge, size: 40,),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => TeamScreen(team)));
      },
    );
  }
}
