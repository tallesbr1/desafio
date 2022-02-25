import 'package:desafio/bloc/cubit/repositories_bloc.dart';
import 'package:desafio/controller/repositories.controller.dart';
import 'package:desafio/repositories/repositories_repository.dart';
import 'package:desafio/views/home.view.dart';
import 'package:desafio/views/home.view2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<RepositoriesController>(RepositoriesController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      //home: HomePage(), //Utilizando Mobx
      home: BlocProvider<RepositoriesBlocCubit>(
        create: (context) => RepositoriesBlocCubit(RepositoriesRepository()),
        child: HomePage2(),
      ),
    );
  }
}
