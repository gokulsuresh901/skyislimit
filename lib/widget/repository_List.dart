import 'package:flutter/material.dart';
class RepositoryList extends StatelessWidget {
  final String text;
  RepositoryList(
      this.text,
      );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.note),
      title: Text(text),
    );
  }
}
