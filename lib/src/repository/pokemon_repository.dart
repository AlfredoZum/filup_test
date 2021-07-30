import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:filup_test/src/model/pokemon_model.dart';

class PokemonRepository {

  Future<PokemonResponse> getPokemons() async {
    try {
      // ignore: always_specify_types
      final Response response = await Dio().get(
        'https://pokeapi.co/api/v2/pokemon',
        options: Options(responseType: ResponseType.json),
      );
      if (response.statusCode != 200) {
        return PokemonResponse.withError('Pokemon not found ', 404);
      }
      return PokemonResponse
          .fromJson(response.data['results'] as List<dynamic>);
    } on DioError catch( e ) {
      return PokemonResponse.withError('An error occurred on the server ', 500);
    }
  }

  Future<Map<String, dynamic>> getPokemon (String name) async {
    try {
      // ignore: always_specify_types
      final Response response = await Dio().get(
        'https://pokeapi.co/api/v2/pokemon/$name/',
        options: Options(responseType: ResponseType.json),
      );
      if (response.statusCode != 200) {
        return {};
      }

      final Map<String, dynamic> data = Map<String, dynamic>
          .from(response.data as Map<String, dynamic>);
      return data;
    } on DioError catch( e ) {
      return {};
    }
  }

}