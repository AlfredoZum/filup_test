import 'package:filup_test/src/model/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypePokemon extends StatelessWidget {

  const TypePokemon(this.fontSize, this.fontWeight, this.color, this.pokemon);

  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {

    final TextStyle _style = TextStyle(
        fontSize: fontSize, fontWeight: fontWeight, color: color
    );
    final String type = pokemon.getType();
    return Text(type, style: _style);
  }
}
