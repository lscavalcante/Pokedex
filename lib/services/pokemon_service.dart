import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/models/pokemon.dart';

class PokemonService {

  static Future<List<Pokemon>> getAllPokemon() async{
    var response = await http.get(ConstsApi.pokeURL);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    Map map = jsonDecode(response.body);
    
    PokeAPI pokeapi = PokeAPI.fromJson(map);

    List<Pokemon> pokemons = pokeapi.pokemon;

    return pokemons;

  }

}