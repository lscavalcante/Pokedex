// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<Pokemon> _$pokemonComputed;

  @override
  Pokemon get pokemon =>
      (_$pokemonComputed ??= Computed<Pokemon>(() => super.pokemon)).value;
  Computed<List<Pokemon>> _$pokemonsComputed;

  @override
  List<Pokemon> get pokemons =>
      (_$pokemonsComputed ??= Computed<List<Pokemon>>(() => super.pokemons))
          .value;

  final _$_pokemonsAtom = Atom(name: '_HomeControllerBase._pokemons');

  @override
  List<Pokemon> get _pokemons {
    _$_pokemonsAtom.context.enforceReadPolicy(_$_pokemonsAtom);
    _$_pokemonsAtom.reportObserved();
    return super._pokemons;
  }

  @override
  set _pokemons(List<Pokemon> value) {
    _$_pokemonsAtom.context.conditionallyRunInAction(() {
      super._pokemons = value;
      _$_pokemonsAtom.reportChanged();
    }, _$_pokemonsAtom, name: '${_$_pokemonsAtom.name}_set');
  }

  final _$_pokemonAtom = Atom(name: '_HomeControllerBase._pokemon');

  @override
  Pokemon get _pokemon {
    _$_pokemonAtom.context.enforceReadPolicy(_$_pokemonAtom);
    _$_pokemonAtom.reportObserved();
    return super._pokemon;
  }

  @override
  set _pokemon(Pokemon value) {
    _$_pokemonAtom.context.conditionallyRunInAction(() {
      super._pokemon = value;
      _$_pokemonAtom.reportChanged();
    }, _$_pokemonAtom, name: '${_$_pokemonAtom.name}_set');
  }

  final _$getPokemonAsyncAction = AsyncAction('getPokemon');

  @override
  Future getPokemon() {
    return _$getPokemonAsyncAction.run(() => super.getPokemon());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setpokemon(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setpokemon(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pokemon: ${pokemon.toString()},pokemons: ${pokemons.toString()}';
    return '{$string}';
  }
}
