import 'package:desafio/controller/repositories.controller.dart';
import 'package:desafio/widgets/appbar.home.widget.dart';
import 'package:desafio/widgets/repositoryItem.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  @override
  RepositoriesController controller;

  HomePage([this.controller]);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RepositoriesController controller;

  @override
  void initState() {
    super.initState();


    controller = widget.controller ?? GetIt.I.get<RepositoriesController>();
    init();
  }

  init() async {
    await controller.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBarHomeWidget(controller),
      body: Observer(
        builder: (_) {
          return (controller.listRepositories == null)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.listRepositories.length,
                  itemBuilder: (context, index) {
                    var item = controller.listRepositories[index];
                    return RepositoryItemWidget(model: item);
                  },
                );
        },
      ),
    );
  }
}
