import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_provider.dart';
import 'package:flutter_bloc_first/blocs/bloc_teams.dart';
import 'package:flutter_bloc_first/model/model_league.dart';
import 'package:flutter_bloc_first/model/model_team.dart';
import 'package:flutter_bloc_first/widgets/image_json.dart';
import 'package:flutter_bloc_first/tile_list_widgets/list_team.dart';
import 'package:flutter_bloc_first/widgets/my_appbar.dart';
import 'package:flutter_bloc_first/widgets/no_data.dart';
import 'package:flutter_bloc_first/widgets/text_alternate.dart';
import 'package:flutter_bloc_first/widgets/wait_screen.dart';

class LeagueScreen extends StatelessWidget {
  final League league;
  LeagueScreen(this.league);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocTeams>(context);
    return Scaffold(
      appBar: MyAppBar(
        titleString: league.name,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ImageJson(
                url: league.images.badge,
                heigth: 100,
              ),
              Column(
                children: <Widget>[
                  TextAlternate(
                    string: league.sport,
                    size: 25,
                  ),
                  TextAlternate(
                    string: league.name,
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5,),
          Divider(),
          Container(
            height: 200,
            child: SingleChildScrollView(
              child: TextAlternate(
                string: league.description.french,
                alternate: league.description.english,
              ),
            ),
          ),
          ImageJson(url: league.images.badge,heigth: 60,),
          Expanded(child: StreamBuilder<List<Team>>(stream: bloc.stream,builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return WaitScreen();
            } else if (snap == null) {
              return NoData('データーなし');
            } else if (!snap.hasData) {
              return NoData('空データー');
            } else {
              return ListTeam(snap.data);
            }
          },)),
        ],
      ),
    );
  }
}
