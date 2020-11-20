import 'dart:async';
import 'package:flutter_bloc_first/model/model_sport.dart';
import 'package:flutter_bloc_first/blocs/bloc.dart';
import 'package:flutter_bloc_first/services/sportsDB_api.dart';

class BlocSport extends Bloc {

  final _streamController = StreamController<List<Sport>>();
  Sink<List<Sport>> get sink => _streamController.sink; //入力
  Stream<List<Sport>> get stream => _streamController.stream; //StreamBuilderのstreamに連結。

  fetchSports() async {
    final sports = await SportsDBApi().fetchSports(); //Apiのリスト化されたデーター
    sink.add(sports); //これを流して、StreamBuilderのstreamで受け取るイメージ。
  }

  BlocSport() { //呼び出す際に使用。
    fetchSports();
  }


  @override
  dispose() => _streamController.close();//デフォルトで覚える。
}