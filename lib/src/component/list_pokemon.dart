import 'package:filup_test/src/component/type_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:filup_test/src/bloc/provider.dart';
import 'package:filup_test/src/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Utils
import 'package:filup_test/src/util/size_config.dart';

class ListPokemon extends StatelessWidget {

  PokemonBloc? pokemonBloc;

  @override
  Widget build(BuildContext context) {

    pokemonBloc = Provider.of(context);

    return StreamBuilder<PokemonResponse>(
      stream: pokemonBloc!.listPokemonStream,
      builder: (BuildContext context, AsyncSnapshot<PokemonResponse> snapshot) {
        if( snapshot.data == null ){
          return Container();
        }
        return _list(snapshot.data!.results);
      },
    );
  }

  Widget _list( List<PokemonModel> data ) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) =>
          _card(context, data[index]),
    );
  }

  Widget _card( BuildContext context, PokemonModel pokemon ){

    final TextStyle _style = TextStyle(
        fontSize: 52.sp,
    );

    return GestureDetector(
      onTap: () {
        pokemonBloc!.setPokemon(pokemon);
        Navigator.pushNamed(context, '/pokemonDetail' );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.row10,
          horizontal: SizeConfig.row20,
        ),
        width: double.infinity,
        height: 115.0,
        child: Card(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.row10 * 2,
                  horizontal: SizeConfig.row10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text(pokemon.name, style: _style),
                    TypePokemon(
                      24.sp,
                      FontWeight.w500,
                      Colors.grey[600]!,
                      pokemon,
                    ),
                  ],
                ),
              ),
              _imagePokemon(pokemon.image!)
            ],
          ),
        ),
      ),
    );
  }

  Widget _imagePokemon(String image){
    return Positioned(
      right: 0.0,
      child: SizedBox(
        width: 135.0,
        child:  Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
