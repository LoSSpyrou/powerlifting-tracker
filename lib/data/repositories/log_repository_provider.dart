import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/database_provider.dart';
import 'log_repository.dart';

final logRepositoryProvider = Provider<LogRepository>((ref) {
  return LogRepository(ref.watch(databaseProvider));
});
