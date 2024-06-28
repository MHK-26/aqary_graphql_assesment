import 'package:aqary_assesment_project/bloc/repositories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql_config.dart';
import 'screen/repositories_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final client = GraphQLConfig.initializeClient();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RepositoriesBloc(client.value),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfig.initializeClient(),
      child: CacheProvider(
        child: MaterialApp(
          title: 'GitHub Repositories',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: RepositoriesScreen(),
        ),
      ),
    );
  }
}
