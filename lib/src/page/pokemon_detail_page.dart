import 'package:filup_test/src/bloc/provider.dart';
import 'package:filup_test/src/component/type_pokemon.dart';
import 'package:filup_test/src/model/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Utils
import 'package:filup_test/src/util/size_config.dart';

class PokemonDetailPage extends StatelessWidget {

  PokemonBloc? pokemonBloc;

  @override
  Widget build(BuildContext context) {

    pokemonBloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: StreamBuilder<PokemonModel>(
        stream: pokemonBloc!.pokemonStream,
        builder: (BuildContext context, AsyncSnapshot<PokemonModel> snapshot) {
          if ( snapshot.data == null ) {
            return Container();
          }
          return Stack(
            children: <Widget>[
              Center(
                child: _cardPokemon(snapshot.data!),
              ),
              Center(
                child: _imagePokemon(snapshot.data!.image!),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _cardPokemon( PokemonModel pokemon ) {

    final TextStyle _style = TextStyle(
      fontSize: 44.sp,
      fontWeight: FontWeight.bold
    );

    final TextStyle _styleDescription = TextStyle(
      fontSize: 24.sp,
      color: Colors.grey[500],
      height: 1.4,
      fontWeight: FontWeight.w600
    );

    const _description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.row20),
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.row20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              Text(pokemon.name, style: _style),
              SizedBox(height: SizeConfig.row10),
              TypePokemon( 26.sp, FontWeight.bold, Colors.black, pokemon ),
              SizedBox(height: SizeConfig.row20),
              _statistics(pokemon),
              SizedBox(height: SizeConfig.row10),
              Text(_description, style: _styleDescription),
              SizedBox(height: SizeConfig.row20),
              _stats( pokemon.stats! ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statistics(PokemonModel pokemon){

    final String category = pokemon.category!['name'].toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _statisticsItem( 'Height', pokemon.height.toString() ),
        _statisticsItem( 'Weight', pokemon.weight.toString() ),
        _statisticsItem( 'Category', category ),
        _statisticsItem( 'Abilities', pokemon.getAbilities() ),
      ],
    );
  }

  Widget _statisticsItem(String title, String item){

    return SizedBox(
      height: 100.0,
      child: Column(
        children: <Widget> [
          Text(title),
          SizedBox(height: SizeConfig.row10),
          Text(item, textAlign: TextAlign.center,),
        ],
      ),
    );
  }

  Widget _stats(List<dynamic> stats){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _statsDescription(stats[0] as Map<String, dynamic>),
        _statsDescription(stats[1] as Map<String, dynamic>),
        _statsDescription(stats[2] as Map<String, dynamic>),
        _statsDescription(stats[3] as Map<String, dynamic>),
        // _statsDescription(stats[4] as Map<String, dynamic>),
      ],
    );
  }

  Widget _statsDescription(Map<String, dynamic> stat){

    final Map<String, dynamic> _stat = stat['stat'] as Map<String, dynamic>;
    final double baseStat = (stat['base_stat'] as int).toDouble();

    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 35.0,
            padding: EdgeInsets.only(top: 100.0 - baseStat),
            child: Container(
              color: Colors.black,
            ),
          ),
          SizedBox(height: SizeConfig.row10),
          Text(_stat['name'].toString(), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _imagePokemon(String image){
    return Positioned(
      right: 0.0,
      top: 0.0,
      child: SizedBox(
        width: 200.0,
        child:  Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
