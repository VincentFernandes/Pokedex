import 'package:pokeapp/model/pokemonDetail.dart';
import 'package:pokeapp/pokeapi_provider.dart';

class Pokemon {
  String name;
  String urlpath;
  Future<PokemonDetail> pokemonDetail;

  Pokemon({this.name, this.pokemonDetail, this.urlpath});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    String _name =
        '${json['name'][0].toUpperCase()}${json['name'].substring(1)}';
    return Pokemon(name: _name, urlpath: json['url']);
  }

  Future<PokemonDetail> getImgUrl() {
    return fetchPokemonImg(urlpath);
  }

  Future<PokemonDetail> getPokemonDetail() {
    return fetchPokemonDetail(urlpath);
  }
}
