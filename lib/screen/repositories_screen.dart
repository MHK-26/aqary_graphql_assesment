import 'package:aqary_assesment_project/bloc/repositories_bloc.dart';
import 'package:aqary_assesment_project/widget/repository_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoriesScreen extends StatefulWidget {
  @override
  _RepositoriesScreenState createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {
  String selectedLanguage = 'All';

  @override
  void initState() {
    super.initState();
    context.read<RepositoriesBloc>().add(FetchRepositories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedLanguage,
            items: [
              'All',
              'JavaScript',
              'Python',
              'Java',
              'Dart',
              'C++',
            ].map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(language),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedLanguage = value;
                });
                context
                    .read<RepositoriesBloc>()
                    .add(FilterRepositoriesByLanguage(value));
              }
            },
          ),
          Expanded(
            child: BlocBuilder<RepositoriesBloc, RepositoriesState>(
              builder: (context, state) {
                if (state is RepositoriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RepositoriesLoaded) {
                  if (state.repositories.isEmpty) {
                    return const Center(child: Text('No repositories found.'));
                  } else {
                    final repositories = state.repositories;
                    return ListView.builder(
                      itemCount: repositories.length,
                      itemBuilder: (context, index) {
                        final repo = repositories[index];
                        return RepositoryTile(repo: repo);
                      },
                    );
                  }
                } else if (state is RepositoriesError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('No repositories found.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
