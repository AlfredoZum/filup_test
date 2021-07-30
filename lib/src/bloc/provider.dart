import 'package:flutter/material.dart';

// Bloc
import 'package:filup_test/src/bloc/pokemon_bloc.dart';
import 'package:filup_test/src/bloc/calendar_bloc.dart';

export 'package:filup_test/src/bloc/calendar_bloc.dart';
export 'package:filup_test/src/bloc/pokemon_bloc.dart';

class Provider extends InheritedWidget {

  factory Provider({ Key? key, required Widget child }) {
    return _instancia ??= Provider._internal(key: key, child: child );
  }

  Provider._internal({ Key? key, required Widget child }) :
        super(key: key, child: child );

  static Provider? _instancia;

  final PokemonBloc pokemonBloc = PokemonBloc();
  final CalendarBloc _calendarBloc = CalendarBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PokemonBloc of ( BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!
        .pokemonBloc;
  }

  static CalendarBloc calendarBloc ( BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!
        ._calendarBloc;
  }
}