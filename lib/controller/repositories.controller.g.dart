// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepositoriesController on _RepositoriesControlleBase, Store {
  Computed<List<RepositoriesItemsModel>> _$listRepositoriesComputed;

  @override
  List<RepositoriesItemsModel> get listRepositories =>
      (_$listRepositoriesComputed ??= Computed<List<RepositoriesItemsModel>>(
              () => super.listRepositories,
              name: '_RepositoriesControlleBase.listRepositories'))
          .value;

  final _$repositoriesAtom =
      Atom(name: '_RepositoriesControlleBase.repositories');

  @override
  ObservableList<RepositoriesItemsModel> get repositories {
    _$repositoriesAtom.reportRead();
    return super.repositories;
  }

  @override
  set repositories(ObservableList<RepositoriesItemsModel> value) {
    _$repositoriesAtom.reportWrite(value, super.repositories, () {
      super.repositories = value;
    });
  }

  final _$filterAtom = Atom(name: '_RepositoriesControlleBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$getAsyncAction = AsyncAction('_RepositoriesControlleBase.get');

  @override
  Future get() {
    return _$getAsyncAction.run(() => super.get());
  }

  final _$_RepositoriesControlleBaseActionController =
      ActionController(name: '_RepositoriesControlleBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_RepositoriesControlleBaseActionController
        .startAction(name: '_RepositoriesControlleBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_RepositoriesControlleBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
repositories: ${repositories},
filter: ${filter},
listRepositories: ${listRepositories}
    ''';
  }
}
