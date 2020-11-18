import 'package:flutter_bloc_first/blocs/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'bloc.dart';

class BlocProvider <T extends Bloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({this.bloc,this.child});

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T> _provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>(); //Tに更新があった場合に検知し返す。
    return _provider.bloc;
  }

  @override
  _BloProviderState createState() => _BloProviderState();
}

class _BloProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }


  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
