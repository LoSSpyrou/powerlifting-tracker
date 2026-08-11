import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repositories/log_repository_provider.dart';
import '../../../../data/services/database.dart';
import '../../../../domain/models/logged_set.dart';

final liftsProvider = StreamProvider<List<Lift>>((ref) {
  return ref.watch(logRepositoryProvider).watchLifts();
});

final todaysSetsProvider = StreamProvider<List<LoggedSet>>((ref) {
  return ref.watch(logRepositoryProvider).watchTodaysSets();
});

final setsForLiftProvider = StreamProvider.family<List<LoggedSet>, int>((
  ref,
  liftId,
) {
  return ref.watch(logRepositoryProvider).watchSetsForLift(liftId);
});
