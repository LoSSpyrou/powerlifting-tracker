import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:powerlifting_tracker/data/repositories/log_repository.dart';
import 'package:powerlifting_tracker/data/services/database.dart';
import 'package:powerlifting_tracker/domain/models/lift_type.dart';

void main() {
  late AppDatabase db;
  late LogRepository repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repository = LogRepository(db);
  });

  tearDown(() => db.close());

  group('watchLifts', () {
    test('emits the seeded default lifts', () async {
      final lifts = await repository.watchLifts().first;
      expect(lifts.map((l) => l.type), [
        LiftType.squat,
        LiftType.bench,
        LiftType.deadlift,
      ]);
    });
  });

  group('logSet', () {
    test('adds the set to watchTodaysSets', () async {
      final lifts = await repository.watchLifts().first;
      final squatId = lifts.first.id;

      await repository.logSet(
        liftId: squatId,
        weight: 140,
        reps: 5,
        rpe: 8,
        unit: WeightUnit.kg,
      );

      final todaysSets = await repository.watchTodaysSets().first;
      expect(todaysSets, hasLength(1));
      expect(todaysSets.single.entry.weight, 140);
      expect(todaysSets.single.entry.reps, 5);
      expect(todaysSets.single.lift.id, squatId);
    });

    test(
      'reuses the same session for multiple sets logged the same day',
      () async {
        final lifts = await repository.watchLifts().first;
        final squatId = lifts.first.id;

        await repository.logSet(
          liftId: squatId,
          weight: 100,
          reps: 5,
          unit: WeightUnit.kg,
        );
        await repository.logSet(
          liftId: squatId,
          weight: 105,
          reps: 3,
          unit: WeightUnit.kg,
        );

        final todaysSets = await repository.watchTodaysSets().first;
        expect(todaysSets, hasLength(2));
        expect(todaysSets.map((s) => s.entry.sessionId).toSet(), hasLength(1));
      },
    );
  });

  group('lastSetForLift', () {
    test('returns null when the lift has no logged sets', () async {
      final lifts = await repository.watchLifts().first;
      expect(await repository.lastSetForLift(lifts.first.id), isNull);
    });

    test('returns the most recently logged set for that lift', () async {
      final lifts = await repository.watchLifts().first;
      final squatId = lifts.first.id;

      await repository.logSet(
        liftId: squatId,
        weight: 100,
        reps: 5,
        unit: WeightUnit.kg,
      );
      await repository.logSet(
        liftId: squatId,
        weight: 110,
        reps: 3,
        unit: WeightUnit.kg,
      );

      final last = await repository.lastSetForLift(squatId);
      expect(last?.weight, 110);
    });
  });

  group('watchSetsForLift', () {
    test('only returns sets logged for the requested lift', () async {
      final lifts = await repository.watchLifts().first;
      final squatId = lifts[0].id;
      final benchId = lifts[1].id;

      await repository.logSet(
        liftId: squatId,
        weight: 100,
        reps: 5,
        unit: WeightUnit.kg,
      );
      await repository.logSet(
        liftId: benchId,
        weight: 60,
        reps: 5,
        unit: WeightUnit.kg,
      );

      final squatSets = await repository.watchSetsForLift(squatId).first;
      expect(squatSets, hasLength(1));
      expect(squatSets.single.lift.id, squatId);
    });
  });
}
