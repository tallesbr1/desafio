import 'package:desafio/bloc/cubit/repositories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarHomeWidget2 extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarHomeWidgetState createState() => _AppBarHomeWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarHomeWidgetState extends State<AppBarHomeWidget2> {
  bool searching = false;

  var textFilterController = TextEditingController(text: "");

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<RepositoriesBlocCubit>(context);

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
                bloc.getRepositories("");
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
                  bloc.getRepositories(value);
                },
                onChanged: ((_) {
                  if (textFilterController.text.length <= 0)
                    bloc.getRepositories("");
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
