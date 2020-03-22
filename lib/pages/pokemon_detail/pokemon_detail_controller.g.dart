// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailController on _PokemonDetailControllerBase, Store {
  Computed<List<Choice>> _$choicesComputed;

  @override
  List<Choice> get choices =>
      (_$choicesComputed ??= Computed<List<Choice>>(() => super.choices)).value;
  Computed<double> _$opacidadeComputed;

  @override
  double get opacidade =>
      (_$opacidadeComputed ??= Computed<double>(() => super.opacidade)).value;

  final _$_opacidadeAtom =
      Atom(name: '_PokemonDetailControllerBase._opacidade');

  @override
  double get _opacidade {
    _$_opacidadeAtom.context.enforceReadPolicy(_$_opacidadeAtom);
    _$_opacidadeAtom.reportObserved();
    return super._opacidade;
  }

  @override
  set _opacidade(double value) {
    _$_opacidadeAtom.context.conditionallyRunInAction(() {
      super._opacidade = value;
      _$_opacidadeAtom.reportChanged();
    }, _$_opacidadeAtom, name: '${_$_opacidadeAtom.name}_set');
  }

  final _$_choicesAtom = Atom(name: '_PokemonDetailControllerBase._choices');

  @override
  ObservableList<Choice> get _choices {
    _$_choicesAtom.context.enforceReadPolicy(_$_choicesAtom);
    _$_choicesAtom.reportObserved();
    return super._choices;
  }

  @override
  set _choices(ObservableList<Choice> value) {
    _$_choicesAtom.context.conditionallyRunInAction(() {
      super._choices = value;
      _$_choicesAtom.reportChanged();
    }, _$_choicesAtom, name: '${_$_choicesAtom.name}_set');
  }

  final _$_PokemonDetailControllerBaseActionController =
      ActionController(name: '_PokemonDetailControllerBase');

  @override
  double controlImagePokemon(dynamic state) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.controlImagePokemon(state);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'choices: ${choices.toString()},opacidade: ${opacidade.toString()}';
    return '{$string}';
  }
}
