import 'package:filup_test/src/model/pokemon_model.dart';
import 'package:filup_test/src/repository/pokemon_repository.dart';
import 'package:rxdart/rxdart.dart';

class PokemonBloc {

  final PokemonRepository _pokemonRepository = PokemonRepository();

  final _loading = BehaviorSubject<bool>();
  final _listPokemon = BehaviorSubject<PokemonResponse>();
  final _pokemon = BehaviorSubject<PokemonModel>();

  Stream<bool> get loadingStream => _loading.stream;
  Stream<PokemonResponse> get listPokemonStream => _listPokemon.stream;
  Stream<PokemonModel> get pokemonStream => _pokemon.stream;

  void getPokemon() async {
    _loading.sink.add(true);
    final PokemonResponse response = await _pokemonRepository.getPokemons();
    if( response.code == 200 ){
      for (final PokemonModel pokemon in response.results) {
        final Map<String, dynamic> responseInfo =
          await _pokemonRepository.getPokemon(pokemon.name);
        pokemon.setInfoPokemon(responseInfo);
      }
      _listPokemon.sink.add(response);
    }
    _loading.sink.add(false);
  }

  void setPokemon( PokemonModel pokemon ){
    _pokemon.sink.add(pokemon);
  }

}