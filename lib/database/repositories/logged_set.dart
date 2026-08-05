import '../database.dart';

class LoggedSet {
  const LoggedSet({required this.entry, required this.lift});

  final SetEntry entry;
  final Lift lift;
}
