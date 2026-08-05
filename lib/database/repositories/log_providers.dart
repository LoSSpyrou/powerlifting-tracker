import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database.dart';
import 'log_repository_provider.dart';
import 'logged_set.dart';

final liftsProvider = StreamProvider<List<Lift>>((ref) {
  return ref.watch(logRepositoryProvider).watchLifts();
});

final todaysSetsProvider = StreamProvider<List<LoggedSet>>((ref) {
  return ref.watch(logRepositoryProvider).watchTodaysSets();
});
