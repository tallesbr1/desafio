import 'package:desafio/models/repositoriesItem.dart';

class RepositoriesModel {
  int totalCount;
  bool incompleteResults;
  List<RepositoriesItemsModel> items;

  RepositoriesModel({this.totalCount, this.incompleteResults, this.items});

  RepositoriesModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(new RepositoriesItemsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
