import 'package:flutter_bloc_first/blocs/bloc.dart';
import 'dart:async';
import 'package:flutter_bloc_first/model/model_league.dart';
import 'package:flutter_bloc_first/services/sportsDB_api.dart';

class BlocLeague extends Bloc {

  final _streamController = StreamController<List<League>>();

  Stream<List<League>> get stream => _streamController.stream;
  Sink<List<League>> get sink => _streamController.sink;

  BlocLeague(String name) {
    fetchLeagues(name);
  }


  fetchLeagues(String name) async {
    final result = await SportsDBApi().fetchLeagues(name);
    sink.add(result);
  }


  @override
  dispose() => _streamController.close();
}