import 'package:desafio/models/repositories.dart';
import 'package:desafio/models/repositoriesItem.dart';
import 'package:dio/dio.dart';

class RepositoriesRepository {
  Dio dio;
  final url =
      'https://api.github.com/search/repositories?q=language:dart&sort=stars&page=1';

  Future<List<RepositoriesItemsModel>> getRepositories() async {
    try {
      dio = Dio();
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        var model = RepositoriesModel.fromJson(response.data);

        return List<RepositoriesItemsModel>.of(model.items);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
