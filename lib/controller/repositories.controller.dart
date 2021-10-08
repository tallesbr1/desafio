import 'package:desafio/models/repositories.dart';
import 'package:desafio/models/repositoriesItem.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'repositories.controller.g.dart';

class RepositoriesController = _RepositoriesControlleBase
    with _$RepositoriesController;

abstract class _RepositoriesControlleBase with Store {
  Dio dio;
  final url =
      'https://api.github.com/search/repositories?q=language:dart&sort=stars&page=1';

  _RepositoriesControlleBase([Dio dio]) {
    if (dio == null) {
      this.dio = Dio();
    } else {
      this.dio = dio;
    }
  }
  
  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @observable
  ObservableList<RepositoriesItemsModel> repositories;

  @action
  Future get() async {
    RepositoriesModel model = await getAll();

    var _list = List<RepositoriesItemsModel>.of(model.items);

    _list.sort((a, b) => b.stargazersCount.compareTo(a.stargazersCount));

    repositories = ObservableList<RepositoriesItemsModel>.of(_list);

    repositories.asObservable();
  }

  @computed
  List<RepositoriesItemsModel> get listRepositories {
    if (filter.isEmpty) {
      return repositories;
    } else {
      return repositories
          .where(
              (item) => item.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  Future<RepositoriesModel> getAll() async {
    try {
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        return RepositoriesModel.fromJson(response.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
