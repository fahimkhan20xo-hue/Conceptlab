import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgressState {
  final String subject;
  final String topic;
  final double value;
  const ProgressState({
    required this.subject,
    required this.topic,
    required this.value,
  });

  ProgressState copyWith({double? value}) => ProgressState(
        subject: subject,
        topic: topic,
        value: value ?? this.value,
      );
}

class ProgressNotifier extends StateNotifier<ProgressState> {
  ProgressNotifier()
      : super(const ProgressState(
          subject: 'PHYSICS  /  FUNDAMENTALS',
          topic: 'Gravity & Motion',
          value: 0.7,
        ));

  void update(double newValue) =>
      state = state.copyWith(value: newValue.clamp(0.0, 1.0));
}

final progressProvider =
    StateNotifierProvider<ProgressNotifier, ProgressState>(
  (ref) => ProgressNotifier(),
);
