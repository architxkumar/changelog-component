import 'package:changelog_component/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChangelogComponent());

class ChangelogComponent extends StatelessWidget {
  const ChangelogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Changelog Component',
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
