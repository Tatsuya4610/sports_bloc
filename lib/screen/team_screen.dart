import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_provider.dart';
import 'package:flutter_bloc_first/blocs/bloc_router.dart';
import 'package:flutter_bloc_first/blocs/bloc_teams.dart';
import 'package:flutter_bloc_first/model/model_team.dart';
import 'package:flutter_bloc_first/widgets/image_json.dart';
import 'package:flutter_bloc_first/widgets/list_team.dart';
import 'package:flutter_bloc_first/widgets/my_appbar.dart';
import 'package:flutter_bloc_first/widgets/no_data.dart';
import 'package:flutter_bloc_first/widgets/text_alternate.dart';
import 'package:flutter_bloc_first/widgets/wait_screen.dart';

class TeamScreen extends StatelessWidget {
  final Team team;
  TeamScreen(this.team);
  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<BlocTeams>(context);
    return Scaffold(
      appBar: MyAppBar(
        titleString: team.name,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ImageJson(
                  url: team.images.badge,
                  heigth: 100,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    children: <Widget>[
                      TextAlternate(
                        string: team.name,
                        size: 25,
                      ),
                      TextAlternate(
                        string: team.sport,
                        size: 20,
                        color: Colors.black54,
                      ),
                      TextAlternate(
                        string: team.leagueName,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            Container(
              height: 150,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextAlternate(
                    string: team.description.french,
                    alternate: team.description.english,
                  ),
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  TextAlternate(
                    string: 'スタジアム',
                    color: Colors.teal,
                    size: 20,
                  ),
                  TextAlternate(
                    string: team.stadium.name,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextAlternate(
                    string: team.stadium.stadiumDesc,
                  ),
                ],
              ),
            ),
            Column(
              children: fans(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> fans() {
    List<Widget> w = [];
    team.images.fanArt.images.forEach((url) => w.add(ImageJson(
          url: url,
        )));
    return w;
  }
}
