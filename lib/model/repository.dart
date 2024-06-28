import 'package:equatable/equatable.dart';

class Repository extends Equatable {
  final String name;
  final String description;
  final int stars;
  final String language;

  const Repository({
    required this.name,
    required this.description,
    required this.stars,
    required this.language,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'] ?? 'No name',
      description: json['description'] ?? 'No description',
      stars: json['stargazerCount'] ?? 0,
      language: json['primaryLanguage']?['name'] ?? 'Unknown',
    );
  }

  @override
  List<Object> get props => [name, description, stars, language];
}
