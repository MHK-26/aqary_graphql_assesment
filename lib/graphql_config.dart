import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink("https://api.github.com/graphql");

  static AuthLink authLink = AuthLink(
    getToken: () async =>
        'Bearer ${dotenv.env['GITHUB_PERSONAL_ACCESS_TOKEN']}',
  );

  static Link link = authLink.concat(httpLink);

  static ValueNotifier<GraphQLClient> initializeClient() {
    return ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  }
}
