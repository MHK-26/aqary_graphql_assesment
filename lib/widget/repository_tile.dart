import 'package:aqary_assesment_project/model/repository.dart';
import 'package:flutter/material.dart';

class RepositoryTile extends StatelessWidget {
  const RepositoryTile({
    super.key,
    required this.repo,
  });

  final Repository repo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repo.name),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            size: 15,
          ),
          const SizedBox(width: 4),
          Text(repo.stars.toString()),
          const SizedBox(width: 8),
        ],
      ),
      trailing: Chip(
        label: Text(repo.language),
      ),
    );
  }
}
