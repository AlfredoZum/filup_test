class PokemonResponse {

  // ignore: avoid_positional_boolean_parameters
  PokemonResponse(this.code, this.status, this.results, this.error);

  PokemonResponse.fromJson( List<dynamic> json )
      : results = ( json.isNotEmpty ) ? json.map((dynamic item) =>
        PokemonModel.fromJson(item)).toList() : <PokemonModel> [],
        code = 200,
        status = true,
        error = '';

  PokemonResponse.withError(this.error, this.code)
      : results = <PokemonModel> [],
        status = false;

  final int code;
  final bool status;
  final List<PokemonModel> results;
  final String error;
}

class PokemonModel {

  PokemonModel({
    required this.id,
    required this.name,
    required this.url,
    required this.type,
    this.image,
    this.weight,
    this.height,
    this.category,
    this.abilities,
    this.stats
  });

  factory PokemonModel.fromJson(dynamic json) => PokemonModel(
    id      : json['id'].toString(),
    name    : json['name'].toString(),
    url     : json['url'].toString(),
    type:  <List<dynamic>> [],
  );

  void setInfoPokemon(Map<String, dynamic> json){

    final String avatar =
      json['sprites']['other']['official-artwork']['front_default'].toString();

    id = json['id'].toString();
    type = json['types'] as List<dynamic>;
    image = avatar;
    weight = json['weight'] as int;
    height = json['height'] as int;
    category = json['species'] as Map<String, dynamic>;
    abilities = json['abilities'] as List<dynamic>;
    stats = json['stats'] as List<dynamic>;
  }

  String getType(){
    final List<dynamic> listType = type
        .map((dynamic item) => item['type']['name'] )
        .toList();

    return listType.join(' / ');
  }

  String getAbilities(){
    final List<dynamic> listType = abilities!
        .map((dynamic item) => item['ability']['name'] )
        .toList();

    return listType.join('\n');
  }

  String id;
  String name;
  String url;
  List<dynamic> type;
  String? image;
  int? weight;
  int? height;
  Map<String, dynamic>? category;
  List<dynamic>? abilities;
  List<dynamic>? stats;

}