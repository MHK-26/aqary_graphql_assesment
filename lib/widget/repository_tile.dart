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
      subtitle: Text(repo.description),
      trailing: SizedBox(
        width: 30,
        child: Row(
          children: [
            Icon(
              Icons.star,
              size: 15,
            ),
            Text(repo.stars.toString()),
          ],
        ),
      ),
    );
  }
}
