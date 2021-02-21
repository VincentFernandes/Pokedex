import 'dart:convert';
import 'package:path/path.dart' as path;

import 'package:pokeapp/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokeapp/model/pokemonDetail.dart';

const BaseUrl = "https://pokeapi.co/api/v2/";

Future<List<Pokemon>> fetchPokemons() async {
  final response =
      // await http.get(path.join(BaseUrl, 'pokemon?offset=0&limit=151'));
      await http.get(path.join(BaseUrl, 'pokemon?offset=0&limit=151'));

  List<Pokemon> listPokemon = new List();

  if (response.statusCode == 200) {
    var decodedResp = jsonDecode(response.body);

    listPokemon = (decodedResp['results'] as List)
        .map((data) => new Pokemon.fromJson(data))
        .toList();

    return listPokemon;
  } else {
    throw Exception('Failed to load Pokemon');
  }
}

Future<PokemonDetail> fetchPokemonDetail(String urlpath) async {
  final response = await http.get(urlpath);

  if (response.statusCode == 200) {
    var decodedResp = jsonDecode(response.body);

    return PokemonDetail.detailFromJson(decodedResp);
  } else {
    throw Exception('Failed to load Pokemon');
  }
}

Future<PokemonDetail> getPokemonByName(String name) async {
  final response = await http.get(path.joinAll([BaseUrl, 'pokemon', name]));

  if (response.statusCode == 200) {
    var decodedResp = jsonDecode(response.body);

    return PokemonDetail.detailFromJson(decodedResp);
  } else {
    throw Exception('Failed to load Pokemon');
  }
}

Future<PokemonDetail> fetchPokemonImg(String urlpath) async {
  final response = await http.get(urlpath);

  if (response.statusCode == 200) {
    var decodedResp = jsonDecode(response.body);

    return PokemonDetail.imgFromJson(decodedResp);
  } else {
    throw Exception('Failed to load Pokemon');
  }
}
