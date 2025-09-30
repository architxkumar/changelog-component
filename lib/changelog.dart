class Changelog {
  final String date;
  final String change;

  Changelog({required this.date, required this.change});
}

List<Changelog> changelogs = [
  Changelog(
    date: '2024-06-01',
    change: 'Added new feature X to improve user experience.',
  ),
  Changelog(
    date: '2024-05-15',
    change: 'Fixed bug Y that caused crashes on startup.',
  ),
  Changelog(
    date: '2024-05-01',
    change: 'Improved performance of feature Z by optimizing algorithms.',
  ),
  Changelog(
    date: '2024-04-20',
    change: 'Updated UI components for a more modern look.',
  ),
  Changelog(
    date: '2024-04-10',
    change: 'Enhanced security measures to protect user data.',
  ),
];