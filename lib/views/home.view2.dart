import 'package:desafio/bloc/cubit/repositories_bloc.dart';
import 'package:desafio/widgets/appbar.home.widget%20copy.dart';
import 'package:desafio/widgets/repositoryItem.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBarHomeWidget2(),
      body: BlocBuilder<RepositoriesBlocCubit, RepositoriesState>(
        bloc: BlocProvider.of<RepositoriesBlocCubit>(context),
        builder: (context, state) {
          if (state is RepositoriesInitial) {
            return Container();
          } else if (state is RepositoriesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RepositoriesLoaded) {
            final items = state.list;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return RepositoryItemWidget(model: item);
              },
            );
          } else if (state is RepositoriesError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
