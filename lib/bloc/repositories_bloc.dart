import 'package:aqary_assesment_project/model/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final GraphQLClient client;
  List<Repository> _allRepositories = []; // List to hold all repositories

  RepositoriesBloc(this.client) : super(RepositoriesInitial()) {
    on<FetchRepositories>(_onFetchRepositories);
    on<FilterRepositoriesByLanguage>(_onFilterRepositoriesByLanguage);
  }

  void _onFetchRepositories(
      FetchRepositories event, Emitter<RepositoriesState> emit) async {
    emit(RepositoriesLoading());

    const String fetchRepositoriesQuery = r'''
  query {
    viewer {
      repositories(first: 50, orderBy: {field: STARGAZERS, direction: DESC}) {
        nodes {
          name
          description
          stargazerCount
          primaryLanguage {
            name
          }
        }
      }
    }
  }
''';

    try {
      final result = await client
          .query(QueryOptions(document: gql(fetchRepositoriesQuery)));

      if (result.hasException) {
        emit(RepositoriesError(result.exception.toString()));
        return;
      }

      _allRepositories =
          (result.data!['viewer']['repositories']['nodes'] as List)
              .map((node) => Repository.fromJson(node))
              .toList();

      emit(RepositoriesLoaded(_allRepositories));
    } catch (error) {
      emit(RepositoriesError(error.toString()));
    }
  }

  void _onFilterRepositoriesByLanguage(
      FilterRepositoriesByLanguage event, Emitter<RepositoriesState> emit) {
    if (_allRepositories.isNotEmpty) {
      if (event.language == 'All') {
        emit(RepositoriesLoaded(_allRepositories));
      } else {
        final filteredRepositories = _allRepositories
            .where((repo) => repo.language == event.language)
            .toList();

        emit(RepositoriesLoaded(filteredRepositories));
      }
    }
  }
}
