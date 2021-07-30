import 'package:flutter/material.dart';

// Pages
import 'package:filup_test/src/page/home_page.dart';
import 'package:filup_test/src/page/pokemons_page.dart';
import 'package:filup_test/src/page/pokemon_detail_page.dart';

final Map<String, WidgetBuilder> customRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => HomePage(),
  '/listPokemon': (BuildContext context) => PokemonsPage(),
  '/pokemonDetail': (BuildContext context) => PokemonDetailPage(),
};