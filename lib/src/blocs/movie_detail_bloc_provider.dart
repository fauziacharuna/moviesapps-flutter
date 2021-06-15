import 'package:flutter/material.dart';
import 'movie_detail_bloc.dart';
export 'movie_detail_bloc.dart';

class MovieDetailBlocProvider extends InheritedWidget {
  final MovieDetailBloc bloc;

  MovieDetailBlocProvider({Key? key, required Widget child})
  : bloc = MovieDetailBloc(),
  super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static MovieDetailBloc of(BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType(aspect: MovieDetailBlocProvider)
    as MovieDetailBlocProvider).bloc;

  }

}