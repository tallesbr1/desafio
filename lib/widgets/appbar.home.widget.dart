import 'package:desafio/controller/repositories.controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppBarHomeWidget extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarHomeWidgetState createState() => _AppBarHomeWidgetState();

  RepositoriesController controller;
  AppBarHomeWidget([this.controller]);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarHomeWidgetState extends State<AppBarHomeWidget> {
  bool searching = false;

  var textFilterController = TextEditingController(text: "");

  RepositoriesController controller; // = GetIt.I.get<RepositoriesController>();

  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? GetIt.I.get<RepositoriesController>();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey[900],
      leading: Image.asset(
        "assets/images/git.png",
        height: 10,
        width: 10,
      ),
      actions: [
        IconButton(
            icon: (!searching) ? Icon(Icons.search) : Icon(Icons.clear),
            onPressed: () {
              if (searching) {
                controller.setFilter("");
                textFilterController.clear();
              } else {
                myFocusNode.requestFocus();
              }

              setState(() {
                searching = !searching;
              });
            }),
      ],
      title: (!searching)
          ? Text(
              "Git Repositories",
              style: TextStyle(fontSize: 22),
            )
          : Container(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                focusNode: myFocusNode,
                controller: textFilterController,
                onSubmitted: (value) {
                  controller.setFilter(value);
                },
                onChanged: ((_) {
                  if (textFilterController.text.length <= 0)
                    controller.setFilter("");
                }),
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Pesquisar..',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
    );
  }
}
