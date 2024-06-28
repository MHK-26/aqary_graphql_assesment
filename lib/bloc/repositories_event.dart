part of 'repositories_bloc.dart';

sealed class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();

  @override
  List<Object> get props => [];
}

class FetchRepositories extends RepositoriesEvent {}

class FilterRepositoriesByLanguage extends RepositoriesEvent {
  final String language;

  FilterRepositoriesByLanguage(this.language);

  @override
  List<Object> get props => [language];
}
