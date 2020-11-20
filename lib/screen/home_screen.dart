import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_provider.dart';
import 'package:flutter_bloc_first/blocs/bloc_sport.dart';
import 'package:flutter_bloc_first/model/model_sport.dart';
import 'package:flutter_bloc_first/tile_list_widgets/list_sport.dart';
import 'package:flutter_bloc_first/widgets/my_appbar.dart';
import 'package:flutter_bloc_first/widgets/no_data.dart';
import 'package:flutter_bloc_first/widgets/wait_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 5;
    final bloc = BlocProvider.of<BlocSport>(context);
    return Scaffold(
      appBar: MyAppBar(titleString: 'スポーツ情報',),
      body: Column(
        children: <Widget>[
          Image.asset('images/Sports.png',height: height,),
          Expanded(child: Container(child: Text('スポーツデータ'),)),
          Container(height: height,child: StreamBuilder<List<Sport>>(
            stream: bloc.stream, //add.sinkから流れた情報を検知。
            builder: (ctx, snapshot) { //ここでのsnapshotはadd.sinkの情報。具体的にはjsonデータのname、id、imageなどのリスト化された情報。
              if (snapshot.connectionState == ConnectionState.waiting) {
                return WaitScreen();
              } else if (snapshot == null) {
                return NoData('データなし');
              } else if (!snapshot.hasData) {
                return NoData('空データ');
              } else {
                return ListSport(snapshot.data);
              }
            },
          ),)
        ],
      ),
    );
  }
}

