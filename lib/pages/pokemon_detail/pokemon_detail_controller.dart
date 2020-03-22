import 'package:mobx/mobx.dart';
part 'pokemon_detail_controller.g.dart';

class PokemonDetailController = _PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class _PokemonDetailControllerBase with Store {
  @observable
  double _opacidade = 1.0;

  @computed
  double get opacidade =>  _opacidade;

  @action
  double controlImagePokemon(state) {
    if (state.extent >= 0.75) {
      _opacidade = 0.5;
      if (state.extent >= 0.85) {
        _opacidade = 0.3;
        if (state.extent >= 0.90) {
          _opacidade = 0.0;
        }
      }
    } else {
      _opacidade = 1;
    }
  }

}
