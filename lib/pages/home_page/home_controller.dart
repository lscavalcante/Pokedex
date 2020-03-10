import 'package:mobx/mobx.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/services/pokemon_service.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  @observable
  List<Pokemon> _pokemons;

  @observable
  Pokemon _pokemon;

  @computed
  Pokemon get pokemon => _pokemon;

  @computed
  List<Pokemon> get pokemons {
   if(_pokemons == null) {
     return _pokemons = [];
   }
    return _pokemons;
  }

  @action
  setpokemon(value) => _pokemon = value;
 

  @action
  getPokemon()  async {
   _pokemons = await PokemonService.getAllPokemon();
   print(_pokemons.length);
  }
}
