import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_league.dart';
import 'package:flutter_bloc_first/blocs/bloc_provider.dart';
import 'package:flutter_bloc_first/model/model_sport.dart';
import 'package:flutter_bloc_first/tile_list_widgets/list_league.dart';
import 'package:flutter_bloc_first/widgets/my_appbar.dart';
import 'package:flutter_bloc_first/widgets/no_data.dart';
import 'package:flutter_bloc_first/model/model_league.dart';
import 'package:flutter_bloc_first/widgets/wait_screen.dart';

class SportScreen extends StatelessWidget {

  final Sport sport;
  SportScreen(this.sport);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocLeague>(context);
    final midHeight = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      appBar: MyAppBar(titleString: sport.name,),
      body: Column(
        children: <Widget>[
          detail(midHeight),
          Expanded(child: StreamBuilder<List<League>>(stream: bloc.stream,builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return WaitScreen();
            } else if (snapshot == null) {
              return NoData('データなし');
            } else if (!snapshot.hasData) {
              return NoData('空データー');
            } else {
              return ListLeague(snapshot.data);
            }
          },))
        ],
      )
    );
  }
  Container detail(double height) {
    return Container(
      height: height,
      child: Card(
        elevation: 7.5,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(sport.thumb),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(sport.desc),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
