import 'dart:async';
import 'package:flutter_bloc_first/blocs/bloc.dart';
import 'package:flutter_bloc_first/model/model_team.dart';
import 'package:flutter_bloc_first/services/sportsDB_api.dart';

class BlocTeams extends Bloc {
  final _streamController = StreamController<List<Team>>();
  Sink<List<Team>> get sink => _streamController.sink;
  Stream<List<Team>> get stream => _streamController.stream;


  BlocTeams(String id) {
    fetchTeams(id);
  }

  fetchTeams(String id) async {
    final teams = await SportsDBApi().fetchTeams(id);
    sink.add(teams);
  }




  @override
  dispose() => _streamController.close();
}