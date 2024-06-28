part of 'repositories_bloc.dart';

sealed class RepositoriesState extends Equatable {
  const RepositoriesState();

  @override
  List<Object> get props => [];
}

class RepositoriesInitial extends RepositoriesState {}

class RepositoriesLoading extends RepositoriesState {}

class RepositoriesLoaded extends RepositoriesState {
  final List<Repository> repositories;

  RepositoriesLoaded(this.repositories);

  @override
  List<Object> get props => [repositories];
}

class RepositoriesFiltered extends RepositoriesState {
  final List<Repository> filteredRepositories;

  RepositoriesFiltered(this.filteredRepositories);

  @override
  List<Object> get props => [filteredRepositories];
}

class RepositoriesError extends RepositoriesState {
  final String message;

  RepositoriesError(this.message);

  @override
  List<Object> get props => [message];
}
