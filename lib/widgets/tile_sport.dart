import 'package:flutter/material.dart';
import 'package:flutter_bloc_first/blocs/bloc_router.dart';
import 'package:flutter_bloc_first/model/model_sport.dart';

class TileSport extends StatelessWidget {
  final Sport sport;
  TileSport(this.sport);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>  Navigator.of(context).push(BlocRouter().sportDetail(sport)),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 7.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              sport.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Image.network(
              sport.thumb,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ],
        ),
      ),
    );
  }
}
