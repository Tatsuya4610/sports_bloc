import 'package:flutter_bloc_first/blocs/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'bloc.dart';

class BlocProvider <T extends Bloc> extends StatefulWidget {
  final T bloc; //add.sinkの情報。
  final Widget child; //ビルドするスクリーン。

  BlocProvider({this.bloc,this.child});

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T> _provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>(); //Tを受けとり時に検知し返す。
    return _provider.bloc;
  }

  @override
  _BloProviderState createState() => _BloProviderState();
}

class _BloProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) {
    return widget.child; //スクリーンのビルド。
  }


  @override
  void dispose() {
    widget.bloc.dispose();//スクリーン更新後に受け取った情報を消去。リセット。
    super.dispose();
  }
}
