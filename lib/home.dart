import 'package:changelog_component/changelog.dart';
import 'package:changelog_component/const.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.heightOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: height * .1,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  pageTitle,
                  style: TextTheme.of(context).displayMedium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  pageSubtitle,
                  style: TextTheme.of(context).labelLarge,
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
              const ChangelogSection(),
              const SizedBox(
                height: 16,
              ),
              FilledButton(
                onPressed: () async {
                  final url = Uri.parse(changelogUrl);
                  if (!await launchUrl(url)) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(changeLogErrorMessage),
                        ),
                      );
                    }
                    throw Exception('Could not launch $url');
                  }
                },
                child: const Text(changelogButtonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangelogSection extends StatelessWidget {
  const ChangelogSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Changelog> changeLogList = changelogs;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: changeLogList
            .map(
              (e) => ChangelogItem(date: e.date, change: e.change),
        )
            .toList(),
      ),
    );
  }
}

class ChangelogItem extends StatelessWidget {
  final String date;
  final String change;

  const ChangelogItem({
    super.key,
    required this.date,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32,
      children: [
        Text(
          date,
          style: TextTheme.of(context).labelMedium,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 1,
              height: 25,
              color: Colors.black,
            ),
            Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 1,
              height: 25,
              color: Colors.black,
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            change,
            style: TextTheme.of(context).titleLarge,
          ),
        ),
      ],
    );
  }
}
