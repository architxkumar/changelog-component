import 'package:changelog_component/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChangelogComponent());

class ChangelogComponent extends StatelessWidget {
  const ChangelogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
