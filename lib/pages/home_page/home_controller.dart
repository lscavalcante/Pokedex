import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon/consts/consts_api.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/services/pokemon_service.dart';
import 'package:provider/provider.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<Pokemon> _pokemons;

  @observable
  Pokemon _pokemon;

  @observable
  int posicaoPokemon;

  @computed
  Pokemon get pokemon => _pokemon;

  @computed
  List<Pokemon> get pokemons {
    if (_pokemons == null) {
      return _pokemons = [];
    }
    return _pokemons;
  }

  @action
  setpokemon(value, {index}) {
    _pokemon = value;
    posicaoPokemon = index;
  }

  @action
  fetchPokemon(context) async {
    _pokemons = await PokemonService.getAllPokemon();

    final pokemon = Provider.of<PokeAPI>(context, listen: false);

    pokemon.pokemon = _pokemons;
  }

}
