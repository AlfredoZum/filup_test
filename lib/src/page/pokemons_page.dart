import 'package:filup_test/src/bloc/provider.dart';
import 'package:filup_test/src/component/list_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Utils
import 'package:filup_test/src/util/size_config.dart';

class PokemonsPage extends StatefulWidget {
  @override
  _PokemonsPageState createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {

  PokemonBloc? pokemonBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((Duration timestamp) {
      final PokemonBloc pokemonBlocInit = Provider.of(context);
      pokemonBlocInit.getPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {

    pokemonBloc = Provider.of(context);

    SizeConfig().init(context);

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(750, 1334));

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        title: const Text('List Pokemon'),
      ),
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  Widget _body(){

    final TextStyle _title = TextStyle(
      fontSize: 28.sp,
      color: Colors.grey[500],
      fontWeight: FontWeight.bold,
    );

    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.row20),
      child: Column(
        children: <Widget> [
          Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.row10 * 3),
            child: Text('CHOOSE YOUR POKEMON', style: _title ),
          ),
          Expanded(
            child: StreamBuilder<bool>(
              stream: pokemonBloc!.loadingStream,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                final bool? active = snapshot.data;
                if ( active == null || active ) {
                  return _loading();
                }
                return ListPokemon();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _loading() => const Center(
    child: CircularProgressIndicator(),
  );

}
