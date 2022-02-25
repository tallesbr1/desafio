import 'package:bloc/bloc.dart';
import 'package:desafio/models/repositories.dart';
import 'package:desafio/models/repositoriesItem.dart';
import 'package:desafio/repositories/repositories_repository.dart';
import 'package:meta/meta.dart';

part 'repositories_bloc_state.dart';

class RepositoriesBlocCubit extends Cubit<RepositoriesState> {
  List<RepositoriesItemsModel> list = [];
  final RepositoriesRepository repository;

  RepositoriesBlocCubit(this.repository) : super(RepositoriesInitial()) {
    getRepositories('');
  }

  Future<void> getRepositories(String filtro) async {
    emit(RepositoriesLoading());

    try {
      if (list.length == 0) {
        list = await repository.getRepositories();
      }
      var _listaFiltrada = list;

      if (filtro.trim().length > 0) {
        _listaFiltrada = list;

        _listaFiltrada = list
            .where((item) =>
                item.name.toLowerCase().contains(filtro.toLowerCase()))
            .toList();
      }

      emit(RepositoriesLoaded(list: _listaFiltrada));
    } catch (e) {
      emit(RepositoriesError(message: "Não foi possivel encontrar os dados"));
    }
  }
}
