part of 'repositories_bloc.dart';

@immutable
abstract class RepositoriesState {}

class RepositoriesInitial extends RepositoriesState {}

class RepositoriesLoading extends RepositoriesState {}

class RepositoriesLoaded extends RepositoriesState {
  List<RepositoriesItemsModel> list=[];
  RepositoriesLoaded({this.list});
}

class RepositoriesError extends RepositoriesState {
  String message;
  RepositoriesError({this.message});
}
