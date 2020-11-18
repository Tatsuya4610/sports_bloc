import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_league.dart';
import 'package:flutter_bloc_first/blocs/bloc_provider.dart';
import 'package:flutter_bloc_first/blocs/bloc_sport.dart';
import 'package:flutter_bloc_first/model/model_sport.dart';
import 'package:flutter_bloc_first/screen/home_screen.dart';
import 'package:flutter_bloc_first/screen/sport_screen.dart';

class BlocRouter {
  
  MaterialPageRoute sportDetail(Sport sp) => MaterialPageRoute(builder: (ctx) => sport(sp));
  
  
  BlocProvider allSports() => BlocProvider<BlocSport>(
        bloc: BlocSport(),
        child: HomeScreen(),
      );
  BlocProvider sport(Sport sport) => BlocProvider<BlocLeague>(
        bloc: BlocLeague(sport.name),
        child: SportScreen(sport),
      );
}
